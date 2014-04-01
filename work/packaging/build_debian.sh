#!/bin/bash

export plain=TRUE

status=0

packages=$(dirname $(readlink -f $0))
export LIBERTY_HOME=$(cd $packages/../..; pwd)
test -d $packages/debs && rm -rf $packages/debs
mkdir $packages/debs

export clean=FALSE
export pbuilder=FALSE
export codename=snapshot
export keep_failed=FALSE

pkgdate=$(date -u +'%Y%m%d.%H%M%S')
export tag="-0~snapshot~$pkgdate"

while [ x$1 != x ]; do
    case $1 in
        -clean)
            clean=TRUE
            ;;
        -release*)
            codename=release
            tag="~release"${1#-release}
            ;;
        -rc*)
            codename=rc
            tag="~rc"${1#-rc}
            ;;
        -pbuilder)
            pbuilder=TRUE
            ;;
        -keep)
            keep_failed=TRUE
            ;;
        *)
            echo "Unknown option: $1" >&2
            exit 1
            ;;
    esac
    shift
done

if [ -d $LIBERTY_HOME/target ] && [ $clean != TRUE ]; then
    export TARGET=$LIBERTY_HOME/target
    export TMPDIR=${TMPDIR:-$TARGET/tmp}
    test -d $TMPDIR || mkdir -m 700 -p $TMPDIR
    export LOGDIR=$TARGET/log
else
    export LOGDIR=${TMPDIR:-/tmp}/liberty-eiffel-logs
fi
mkdir -p $LOGDIR
orig_home=$HOME
export HOME=$(mktemp -d -t liberty-eiffel-home.XXXXXX)
export TARGET=${TARGET:-$HOME/target}

if [ $pbuilder == TRUE ]; then
    cat > $HOME/.pbuilderrc <<EOF
APTCACHE=$TARGET/pbuilder/.data/aptcache
BUILDPLACE=$TARGET/pbuilder/.data/build
BUILDRESULT=$TARGET/pbuilder/.data/result
CCACHEDIR=$TARGET/pbuilder/.data/ccache
BUILDUSERID=9999
COMPRESSPROG=pigz
DISTRIBUTION=stable
EXTRAPACKAGES="gcc g++"
EOF

    if sudo -l /usr/sbin/pbuilder >/dev/null 2>&1; then
        for arch in $(dpkg --print-architecture; dpkg --print-foreign-architectures); do
            dir=$LIBERTY_HOME/target/pbuilder/liberty-$arch
            if [ -e $dir/base.tgz ]; then
                log=$LOGDIR/pbuilder_update_$(date -u +'%Y%m%d.%H%M%S')_$arch.log
                sudo -n -E /usr/sbin/pbuilder --update --basetgz $dir/base.tgz > $log 2>&1 || {
                    echo "**** pbuilder --update failed: see $log"
                }
            else
                mkdir -p $dir
                log=$LOGDIR/pbuilder_create_$(date -u +'%Y%m%d.%H%M%S')_$arch.log
                sudo -n -E /usr/sbin/pbuilder --create --basetgz $dir/base.tgz --architecture $arch --extrapackages 'gcc g++' > $log 2>&1 || {
                    echo "**** pbuilder --create failed: see $log"
                }
            fi
        done
    fi
fi

test -d $HOME/.config/liberty-eiffel || {
    if [ -d $orig_home/.config/liberty-eiffel ]; then
        mkdir -p $HOME/.config/liberty-eiffel
        cp -a $orig_home/.config/liberty-eiffel/* $HOME/.config/liberty-eiffel
    fi
}

test -d $TARGET/bin || {
    echo
    echo "Generating executables"
    $LIBERTY_HOME/install.sh -plain -bootstrap
}

test -d $TARGET/doc || {
    echo
    echo "Generating doc"
    $LIBERTY_HOME/install.sh -plain -doc
}

do_debuild() {
    tmp=$1

    r=0
    if egrep -q '^Architecture: all$' debian/control; then
        debuild -us -uc > "$LOGDIR/$(basename $tmp)_all.log" 2>&1 || {
            echo "**** debuild failed: see $LOGDIR/$(basename $tmp)_all.log"
            r=1
        }
    elif [ $pbuilder == TRUE ]; then
        for arch in $(dpkg --print-architecture; dpkg --print-foreign-architectures); do
            pdebuild --architecture $arch --buildresult $tmp/.. --debbuildopts '-us -uc' -- \
                     --basetgz $LIBERTY_HOME/target/pbuilder/liberty-$arch/base.tgz > $LOGDIR/$(basename $tmp)_$arch.log 2>&1 || {
                echo "**** pdebuild failed: see $LOGDIR/$(basename $tmp)_$arch.log"
                r=$(($r + 1))
            }
        done
    else
        arch=$(dpkg --print-architecture)
        debuild -us -uc > "$LOGDIR/$(basename $tmp)_${arch}.log" 2>&1 || {
            echo "**** debuild failed: see $LOGDIR/$(basename $tmp)_${arch}.log"
            r=1
        }
    fi

    return $r
}

echo
echo "Generating packages"
version=$(head -n 1 $packages/debian.skel/debian/changelog | sed 's/#SNAPSHOT#/'"$tag"'/g;s/#DATE#/'"$(date -R)"'/g' | awk -F'[()]' '{print $2}')
for debian in $packages/*.pkg/debian; do
    package_dir=${debian%/debian}
    package=$(basename ${debian%.pkg/debian})
    tmp=$(mktemp -d -t $package-deb.XXXXXX)
    echo "    $package $version (working in $tmp)"
    cd $tmp
    mkdir build
    cd build
    mkdir debian

    # copy layers
    cp -a $packages/debian.skel/* .
    cp -a $package_dir/* .

    # customize debian/changelog
    sed 's/#SNAPSHOT#/'"$tag"'/g;s/#DATE#/'"$(date -R)"'/g' -i debian/changelog

    # customize debian/control
    mv debian/control debian/control~
    {
        cat <<EOF
Source: liberty-eiffel
Section: devel
Priority: extra
Maintainer: Cyril Adrian <cyril.adrian@gmail.com>
Build-Depends: debhelper (>= 8.0.0), docbook-to-man, libgc-dev
Standards-Version: 3.9.2
Homepage: http://www.gnu.org/software/liberty-eiffel/
Vcs-Git: http://git.savannah.gnu.org/cgit/liberty-eiffel.git

EOF
        cat debian/control~
    } | sed 's/#VERSION#/'"$version"'/g' > debian/control
    rm debian/control~

    # customize Makefile
    mv Makefile Makefile~
    {
        cat <<EOF
LIBERTY_HOME := ${LIBERTY_HOME}
PACKAGE := $(echo ${package} | sed 's/^liberty-eiffel-//;s/-/_/g')
plain := ${plain}

EOF

        cat Makefile~
    } > Makefile
    rm Makefile~

    # now let debian helpers run
    if do_debuild $tmp; then
        cp $tmp/*.deb $packages/debs/
        cd $packages
        rm -rf $tmp
    else
        cp $tmp/*.deb $packages/debs/
        if [ $keep_failed == TRUE ]; then
            echo
            echo "**** Keeping $tmp for forensics"
            echo
        else
            cd $packages
            rm -rf $tmp
        fi
        status=$(($status + 1))
    fi
done

rm -rf $HOME

echo
echo "Generated packages:"
for deb in $packages/debs/*.deb; do
    echo " -  $deb"
done

echo
echo "Adding packages to repository"
mkdir -p $LIBERTY_HOME/website/apt
for deb in $packages/debs/*.deb; do
    reprepro --basedir $LIBERTY_HOME/website/apt includedeb $codename $deb || status=$(($status + 1))
done

echo
echo "Done (status=$status)."
echo

exit $status

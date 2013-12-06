#!/bin/bash
cd /home/et/Liberty_savannah

{
    git fetch origin
    echo
    for branch in $(git branch -r | cut -c3- | grep ^origin/ | grep -v HEAD | cut -c8-); do
        git checkout $branch
        echo
        git merge --ff-only origin/$branch
    done
    git push --tags github :
} 2> pull.err > ../pull.out

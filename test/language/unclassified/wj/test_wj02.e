class TEST_WJ02
-- From: Gabriel Wei�elberg <gabriel.weisselberg@brokat-le.com>
creation make
feature
  make is
      local a: AUX_WJ02A1; c: AUX_WJ02C1;
    do
       create a.make("a");
       create c;
      if c.output(a) /= Void then end;
    end

end

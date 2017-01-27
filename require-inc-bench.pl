#!/usr/bin/env perl

use Benchmark::Dumb qw(:all);

use Simple::Accessor;

cmpthese(
  0.05, # 5% precision
  {
    require => \&test_require,
    with_INC => \&test_require_inc,
  }
);

sub test_require {
	require Simple::Accessor;
}

sub test_require_inc {
	require Simple::Accessor unless $INC{'Simple/Accessor.pm'};
}

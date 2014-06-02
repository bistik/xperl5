use strict;
use warnings;

use Test::More 'no_plan';

my $module = $ENV{EXERCISM} ? 'Example' : 'Triplet';
ok -e "$module.pm", "Missing $module.pm" or BAIL_OUT "You need to create file: $module.pm";

eval "use $module";
ok !$@, "Cannot load $module" or BAIL_OUT "Cannot load $module. Does it compile? Does it end with 1;?";

can_ok $module, "new",     or BAIL_OUT "Missing package $module; or missing sub new()";
can_ok $module, "product", or BAIL_OUT "Missing package $module; or missing sub product()";
can_ok $module, "is_pythagorean", or BAIL_OUT "Missing package $module; or missing sub is_pythagorean()";
can_ok $module, "where" or BAIL_OUT "Missing package $module; or missing sub where()";
can_ok $module, "map" or BAIL_OUT "Missing package $module; or missing sub map()";

my $triplet = $module->new(3, 4, 5);
is $triplet->sum, 12, "test sum";
is $triplet->product, 60, "test product";
ok $triplet->is_pythagorean, "test if pythagorean";

$triplet = $module->new(5, 6, 7);
ok !$triplet->is_pythagorean, "test not a pythagorean";

use strict;
use warnings;

use Test::More;

my @cases = (
    ['Tom-ay-to, tom-aaaah-to.', 'Whatever.'],
);


plan tests => 3 + @cases;

ok -e 'Bob.pm', 'missing Bob.pm'
    or BAIL_OUT("You need to create a module called Bob.pm with a function called hey() that gets one parameter: The text Bob hears.");

eval "use Bob";
ok !$@, 'Cannot load Bob.pm'
    or BAIL_OUT('Does Bob.pm compile?  Does it end with 1; ?');

can_ok('Bob', 'hey') or BAIL_OUT("Missing package Bob; or missing sub hey {}");

foreach my $c (@cases) {
    is Bob::hey($c->[0]), $c->[1], $c->[0];
}





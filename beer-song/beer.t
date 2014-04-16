use strict;
use warnings;

use Test::More;

my $module = $ENV{EXERCISM} ? 'Example' : 'Raindrops';

use JSON qw(from_json);

my $cases_file = 'cases.json';
my $cases;
if (open my $fh, '<', $cases_file) {
    local $/ = undef;
    $cases = from_json scalar <$fh>;
} else {
    die "Could not open '$cases_file' $!";
}




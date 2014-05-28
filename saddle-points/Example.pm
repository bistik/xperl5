package Example;

use strict;
use warnings;

sub new {
    my ($class, $matrix_str) = @_;
    my $self = bless {}, $class;
    my @rows = map { [split /\s/, $_] }  split /\n/, $matrix_str;

    foreach my $i ( 0..$#rows ) {
        my @row;
        foreach my $j ( 0..$#{$rows[0]} ) {
            push @row, $rows[$j]->[$i];
        }
        push @{$self->{columns}}, \@row;
    }
    $self->{rows} = \@rows;

    return $self;
}

sub rows { $_[0]->{rows}->[ $_[1] ] }
sub columns { $_[0]->{columns}->[ $_[1] ] }
sub saddle_points {}

1;

package Entry;

use strict;
use warnings;

sub new {
    my ($class, $args) = @_;
    my $self = bless {  id => $args->{id},
                        name => $args->{name},
                        cart => $args->{cart}
    }
}

# Get name of this Entry
sub get_name {
    my $self = shift;
    return $self->{name};
}

# Set name of this Entry
sub set_name {
    my ($self, $new_name) = @_;
    $self->{name} = $new_name;
}

# Get color of this Entry
sub get_color {
    my $self = shift;
    return $self->{color};
}

# Set color of this Entry
sub set_color {
    my ($self, $new_color) = @_;
    $self->{name} = $new_color;
}

# Return formatted string for Entry
sub to_string {
    my $self = shift;
    return "Entry ID: $self->{id}\n"
                ."====================\n"
                ."Name:\t$self->{name}\n"
                ."Cart:\t", join(", ", @{ $self->{cart} }), "\n"
                ."\n";
}

1;

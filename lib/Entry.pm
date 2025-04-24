package Entry;

use strict;
use warnings;

sub new {
    my ($class, $args) = @_;
    my $self = bless {  id => $args->{id},
                        name => $args->{name},
                        color => $args->{color},
                        food => $args->{food},
                        month => $args->{month}
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

# Get food of this Entry
sub get_food {
    my $self = shift;
    return $self->{food};
}

# Set food of this Entry
sub set_food {
    my ($self, $new_food) = @_;
    $self->{food} = $new_food;
}

# Get month of this Entry
sub get_month {
    my $self = shift;
    return $self->{month};
}

# Set month of this Entry
sub set_month {
    my ($self, $new_food) = @_;
    $self->{month} = $new_food;
}

# Return formatted string for Entry
sub to_string {
    my $self = shift;
    return "Entry ID: $self->{id}\n"
                ."====================\n"
                ."Name:\t$self->{name}\n"
                ."Color:\t$self->{color}\n"
                ."Food:\t$self->{food}\n"
                ."Month:\t$self->{month}\n"
                ."\n";
}

1;
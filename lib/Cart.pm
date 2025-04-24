package Cart;

use strict;
use warnings;

sub new {
    my ($class, $args) = @_;
    my $self = bless {  id => $args->{id},
                        name => $args->{name},
                        contents => $args->{contents}
    }
}

# Get ID of this Cart
sub get_id {
    my $self = shift;
    return $self->{id};
}

# Set name of this Cart
sub set_id {
    my ($self, $new_id) = @_;
    $self->{name} = $new_id;
}

# Get name of this Cart
sub get_name {
    my $self = shift;
    return $self->{name};
}

# Set name of this Cart
sub set_name {
    my ($self, $new_name) = @_;
    $self->{name} = $new_name;
}

# Get contents of this Cart
sub get_contents {
    my $self = shift;
    return $self->{contents};
}

# Set contents of this Cart
sub set_items {
    my ($self, $new_contents) = @_;
    $self->{contents} = $new_contents;
}


# Return formatted string for Cart
sub to_string {
    my $self = shift;
    my @contents_list = @{$self->{contents}};
    my $contents_string = "";
    foreach my $c (@contents_list) {
        $contents_string = $contents_string.$c."\n";
    }
    return "#$self->{id} $self->{name}'s Shopping Cart:\n"
                ."-------------------------\n"
                .$contents_string
                ."\n";
}

1;
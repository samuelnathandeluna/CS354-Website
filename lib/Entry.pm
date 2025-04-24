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

# Get id of this Entry
sub get_id {
    my $self = shift;
    return $self->{id};
}

# Get name of this Entry
sub get_name {
    my $self = shift;
    return $self->{name};
}

# Get color of this Entry
sub get_cart {
    my $self = shift;
    return $self->{cart};
}

# Print report header
sub print_header {
    printf "%-6s %-10s %-s\n", "ID", "Name", "Cart";
    print "-" x 40, "\n";
}

# Return formatted string for Entry
sub to_string {
    my $self = shift;
    return sprintf (
		"%-6s %-10s %-s\n",
		$self->get_id(),
		$self->get_name(),
                join(", ", @{ $self->get_cart() })
	);
}

1;


#!/bin/perl
use strict;
use warnings;

use lib 'lib';
use Cart;

# Main execution block
sub main {
        # Prompt user for input:
        print   "==================================================\n"
                ."Welcome to Shopping Cart Search!\n\n"
                ."We maintain a database of personalized shopping carts.\n"
                ."Use our interface to search for specific shopping carts,\n"
                ."by their ID, name, and/or shopping items.\n\n" 
                ."(Enter IDs, names, and/or items in a comma-separated list):\n";
        my $query = <STDIN>;
        chomp $query;
        my @query_items = split ", ", $query;

        # Create a list of Cart hashes that satisfy the query items:
        open(my $data, '<', "data.csv") or die;
        my @carts = @{search_data($data, @query_items)};
        close($data);

        # Print total carts found:
        print "\nTotal carts found: ".scalar @carts."\n"
                ."++++++++++++++++++++++++++++++++++++++++++++++++++\n\n";
        foreach my $c (@carts) {
                my $cart = Cart->new($c);
                print $cart->to_string();
        }
        print   "Thank you for using Shopping Cart Search. Until next time!"
                ."\n==================================================\n";
}

sub search_data {
        my ($data, @query_items) = @_;
        my @carts = ();

        # Read the data, look for Carts that satisfy query items:
        while (my $line = <$data>) {
                chomp $line;
                my @items = split ", ", $line;
                my $has_all = 1;

                # Check if items has all query items:
                my $has_q;
                foreach my $q (@query_items) {
                        $has_q = 0;
                        foreach my $i (@items) {
                                if ($i eq $q) {
                                        $has_q = 1;
                                }
                        }
                        $has_all *= $has_q;
                        if ($has_all == 0) {
                                last;
                        }
                }

                # If items has all query items, add this cart:
                if ($has_all) {
                        my $new_id = shift(@items);
                        my $new_name = shift(@items); 
                        my @cart_hash = ({
                                id => $new_id,
                                name => $new_name,
                                contents => \@items
                        });
                        push (@carts, @cart_hash);
                }
        }

        return \@carts;
}

main();

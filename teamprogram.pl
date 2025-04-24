#!/bin/perl
use strict;
use warnings;

use lib 'lib';
use Entry;

# Main execution block
sub main {
        print   "Search for shopping carts\n" 
                ."(Enter IDs, names, and/or items in a comma-separated list):\n";
        my $query = <STDIN>;
        chomp $query;
        my @filter = split ", ", $query;

        # A list to store Entry hashes:
        my @entries = ();

        # Open the CSV file:
        my $file = $ARGV[0] or die;
        open(my $data, '<', $file) or die;

        # Read the CSV and store data as Entry hashes:
        while (my $line = <$data>) {
                chomp $line;
                my @items = split ", ", $line;
                my $match = 1;

                my $hasf;
                foreach my $f (@filter) {
                        $hasf = 0;
                        foreach my $i (@items) {
                                if ($i eq $f) {
                                        $hasf = 1;
                                }
                        }
                        $match *= $hasf;
                        if ($match == 0) {
                                last;
                        }
                }

                if ($match) {
                        my @entry_hash = ({
                                id => $items[0],
                                name => $items[1],
                                color => $items[2],
                                food => $items[3],
                                month => $items[4]
                        });

                        # Push this Entry hash to the list
                        push (@entries, @entry_hash);
                }

        }

        foreach my $e (@entries) {
                # Find an Entry hash, turn it into an Entry object:
                my $entry = Entry->new($e);

                # Print the Entry:
                print $entry->to_string();
        }

}

main();

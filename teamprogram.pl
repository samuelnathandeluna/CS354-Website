#!/bin/perl
use strict;
use warnings;

use lib 'lib';
use Entry;

# Main execution block
sub main {
        
        # A list to store Entry hashes:
        my @entries = ();

        # Open the CSV file:
        my $file = $ARGV[0] or die;
        open(my $data, '<', $file) or die;

        # Read the CSV and store data as Entry hashes:
        while (my $line = <$data>) {
                chomp $line;
                my @items = split ", ", $line;
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

        # Find an Entry hash, turn it into an Entry object:
        # (Hard-coded '2' as an example. We need to find a way to let the
        # user specify what entries to display.)
        my $entry = Entry->new($entries[2]);

        # Print the Entry:
        print $entry->to_string();
}

main();

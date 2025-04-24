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
        my $file = $ARGV[0] or die "Error: Missing filename argument. Usage: $0 <filename> <query>\n";
        open(my $data, '<', $file) or die "Error: Can't open file '$file': $!\n";

	my $query = $ARGV[1] or die "Error: Missing query argument. Usage: $0 <filename> <query>\n";
        chomp $query;
        my @filter = split ",", $query;

	if (@ARGV > 2) {
		die "Error: Too many arguments provided. Usage: $0 <filename> <query>\n";
	}

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
                                cart => [ @items[2..$#items] ]
                        });

                        # Push this Entry hash to the list
                        push (@entries, @entry_hash);
                }

        }

	Entry->print_header();
        foreach my $e (@entries) {
                # Find an Entry hash, turn it into an Entry object:
                my $entry = Entry->new($e);

                # Print the Entry:
		print $entry->to_string();
                # print $entry->to_string();
        }

}

main();

#!/bin/perl
use strict;
use warnings;

my $file = $ARGV[0] or die;
open(my $data, '<', $file) or die;

while (my $line = <$data>) {
        chomp $line;
        my @words = split ", ", $line;

        #Replace this code below to make the program more complex.
        foreach my $i (@words) {
                print "$i ";
        }
        print "\n"
}
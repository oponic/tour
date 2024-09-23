#!/usr/bin/perl
use strict;
use warnings;
my $save_file = "/usr/local/tourcore/save/data";

my $action = $ARGV[0] || '';
my $key = $ARGV[1] || '';
my $value = $ARGV[2] || '';

if ($action eq 'Save') {
    if ($key && $value) {
        open my $fh, '>>', $save_file or die "Cannot open file: $!";
        print $fh "$key = $value\n";
        close $fh;
        print "OK";
    } else {
        print "Missing key or value for Save action.\n";
    }
} 
elsif ($action eq 'Read') {
    if (-e $save_file) {
        open my $fh, '<', $save_file or die "Cannot open file: $!";
        while (my $line = <$fh>) {
            chomp $line;
            my ($stored_key, $stored_value) = split / = /, $line, 2;
            print "$stored_key = $stored_value\n";
        }
        close $fh;
    } else {
        print "NO";
    }
} 
else {
    print "WARNING: Using savedataman can permanently fuck your save file\n";
    print "if $1 is Save, data will be saved to table\n";
    print "if $1 is Read, data will be read from the table\n";
}

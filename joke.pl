#!/usr/bin/perl -w
## Thu May 22 01:02:56 MST 2025
## Christopher neo@ctopher.me 

## Code from ChatGPT. just a joke.

use strict;
use warnings;

print "=== Cosmic Calculator ===\n";
print "Warning: Dividing by zero may reboot the universe.\n";
print "Enter the numerator: ";
my $numerator = <STDIN>;
chomp($numerator);

print "Enter the denominator: ";
my $denominator = <STDIN>;
chomp($denominator);

my $result = divine_divide($numerator, $denominator);
print "Result: $result\n";

sub divine_divide {
    my ($num, $den) = @_;

    # Dramatic pause
    if ($den == 0) {
        print "\n[!] Reality breach detected...\n";
        sleep(1);
        print "[!!] Quantum threads unraveling...\n";
        sleep(1);
        print "[!!!] Rebooting the universe...\n";
        sleep(2);
		print "Say Goodbye. . .\n";
		sleep(1);

        # Optional: Fork a fake system reboot (UNIX only)
        if ($^O ne 'MSWin32') {
            system("say 'Goodbye.'") if `which say`;  # macOS fun
            system("clear");
        }

        return "🌌 SYSTEM REBOOT INITIATED...";
    }

    return $num / $den;
}


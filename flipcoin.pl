#!/usr/bin/perl -w
## Mon Oct 28 21:49:06 PDT 2013
## Christopher neo@ctopher.me

use strict;



for (my $a = 3; $a > 0;) {
 	&Choose();
 	$a--;
}



sub Choose {

my $countT	= "0";
my $countF	= "0";
my @zeros = qw( 0 ) x 10000;
my @ones = qw( 1 ) x 10000;
my @set = ();

push @set, (@zeros, @ones);




# fisher_yates_shuffle( \@array ) : generate a random permutation
# of @array in place
sub fisher_yates_shuffle {
    my $array = shift;
    my $i;
    for ($i = @$array; --$i; ) {
        my $j = int rand ($i+1);
        next if $i == $j;
        @$array[$i,$j] = @$array[$j,$i];
    }
}

fisher_yates_shuffle( \@set );    # permutes @array in place




my @group	= splice(@set, 0, 10000);


foreach my $test (@group) {

	if ($test eq "1") {
		$countT++;
	}	
		else
	{
		$countF++;
	}



}

if ($countT > $countF) {print "Heads\n";} else { print "Tails\n";}

# print "@set\n";


}

exit(0);



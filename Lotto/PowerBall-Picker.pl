#!/usr/bin/perl -w
## Thu Sep 14 18:43:22 MST 2023
## Christopher ctopher@mac.com

# Modified Code;

### #!/usr/bin/perl -w
## Thu Sep 12 15:35:35 PDT 2013
## Christopher ctopher@mac.com

use strict;
use Array::Pick::Scan qw(pick);


my $start	= time;




our @major	= ();
our @picks	= ();

our @spots	= ();
our @mega	= ();

our @group1 = ();



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


&CreateSpots();



my $file	= "Winning-numbers-5.txt";

open (FI, $file) || die "Sorry dave, failed $file $!";

while (<FI>) {

	chomp;
	my $line = $_;
	push @major, $line;

}

our $runs = "40";
my $i = "0";

while ($runs >= 1) {
	&Setup();
	$runs--;

}



sub Setup {

	my @group = ();



	my $number1 = $major[ rand @major ];
	my $number2 = $major[ rand @major ];
	my $number3 = $major[ rand @major ];
	my $number4 = $major[ rand @major ];
	my $number5 = $major[ rand @major ];
	my $number6 = $major[ rand @major ];
	my $number7 = $major[ rand @major ];
	my $number8 = $major[ rand @major ];
	my $number9 = $major[ rand @major ];
	my $number10 = $major[ rand @major ];
	my $number11 = $major[ rand @major ];
	my $number12 = $major[ rand @major ];





	push @group, $number1, $number2, $number3, $number4, $number5, $number6, $number7, $number8, $number9, $number10, $number11, $number12;



foreach my $num (@group) {

	&StackSet($num);
#	print "@spots\n";

	if ($runs <= 0) { &SelectPicks(); exit(0); }

}



}

















my $endt	= time;
my $total	= $endt - $start;
print "$total time\n";





#############################


sub CreateSpots {

my $set = 0;
my $count = 1;
for (my $dd = 0; $dd <= 69; $dd++) {
        $spots[$dd] = $set;

        $set++;
}

my $set1        = 0;
my $count1 = 1;
for (my $dd2 = 0; $dd2 <= 26; $dd2++) {
        $mega[$dd2] = $set1;
        $set1++;
}


}

our @RR = ();

sub SelectPicks {
	foreach my $item (@spots) {
		if ($item eq "x") {
			# do nothing.
		} else {
		push @RR, $item;
		}

	}



	# Run Picker to select numbers...
	&LottoGen();


	my @over	= ();

	@over = (sort{ $a <=> $b} @RR);


	print "\n\nPICKS: @over\n";
	exit(0);

}




sub LottoGen {


	my @data1	= ();
	my @data2	= ();

	fisher_yates_shuffle( \@RR );    # permutes @array in place

	my $d1		= $RR[ rand @RR ];
	my $d2		= $RR[ rand @RR ];
	my $d3		= $RR[ rand @RR ];
	my $d4		= $RR[ rand @RR ];
	my $d5		= $RR[ rand @RR ];



	# make sure they numbers are unique.
	push @data1, $d1, $d2, $d3, $d4, $d5;


	my $answer = &RackSet(@data1);

	if ($answer ne "dull") {

		my $powerball = genlotto();

		my $answer1 = $answer . "," . $powerball;



		print "\n\nAnswer is: $answer1\n";
		# use answer, and fetch powerball.

	} else {

		&LottoGen();


	}


	fisher_yates_shuffle( \@group1);    # permutes @array in place



	my $x1	= $group1[ rand @group1 ];
	my $x2	= $group1[ rand @group1 ];
	my $x3	= $group1[ rand @group1 ];
	my $x4	= $group1[ rand @group1 ];
	my $x5	= $group1[ rand @group1 ];



	# make sure they numbers are unique.
	push @data2, $x1, $x2, $x3, $x4, $x5;


	my $answer2 = &RackSet(@data2);

	my ($a1, $a2, $a3, $a4, $a5) = split(/,/, $answer2);






	if ($answer2 ne "dull") {


		if ($a1 != "0") {

		my $powerball2 = genlotto();

		my $answer3 = $answer2 . "," . $powerball2;



		print "\n\nAnswer2 is: $answer3\n";
		# use answer, and fetch powerball.

	} else {


	print "No Answer #2\n\n";

	}


	}


	# return results.


}









sub genlotto {
	my $number	= shift;
	my @draw	= ();
	my @set2	= ( 1 .. 26 );

	fisher_yates_shuffle( \@set2 );    # permutes @array in place

	my $y1		= $set2[ rand @set2 ];
	return $y1;

}


sub StackSet {

	my $line = shift;
	my ($a, $b, $c, $d, $e) = split(/-/, $line);

	push @group1, $a, $b, $c, $d, $e;

	$spots[$a]	= "x";
	$spots[$b]	= "x";
	$spots[$c]	= "x";
	$spots[$d]	= "x";
	$spots[$e]	= "x";

	$spots[0]	= "x";

	print "$line\n";




my $data = "1";
my $count = "1";


foreach my $item (@spots) {

	if ($item eq "x") {

		$count++;

	if ($count >= 55 && $count <= 64) {

		$runs = "0";


		}

	} else {

	$data++;
	}

}
	if ($data >= 5 && $data <= 20) {
		print "Found Count\n";
		$runs = "0";

}


}





sub RackSet {
        my @list = @_;
                my %seen        = ();
                my @uniq1       = ();
                foreach my $item (@list) {
                        unless($seen{$item}) {
                                $seen{$item}    = "1";
                                push (@uniq1, $item);
                        }
                }

                my $count       = @uniq1;
                if ($count == "5") {
                        my @sorted = sort { $a <=> $b } @uniq1;
                        my $string = join(",", @sorted);
                        return $string;
                } else {
                        return("dull");
                }
}








exit(0);



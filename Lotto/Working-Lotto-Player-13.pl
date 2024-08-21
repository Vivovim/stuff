#!/usr/bin/perl -w
## Sun Sep  3 19:17:22 MST 2023
## Christopher neo@ctopher.me
## This code, was done 1-03-2024.
## Play all 13 draws on one set of tickets.
## Uses all 5 * 13 numbers from the available.
## will get a winning ticket from this someday.



use strict;



#### These are in use.

our %gate1	= ();
our %gate2	= ();
our @spots = ();
our @mega	= ();



print "Play all 13 numbers each draw. uses 65 numbers from 5/5\n\n";



&Setup();




sub Setup {


	@spots	= ( 1 .. 69 );
	@mega	= ( 1 .. 26 );


	foreach my $i (@spots) {

		$gate1{$i}	= $i;

		}


	foreach my $ii (@mega) {

		$gate2{$ii}		= $ii;

	}


#	print "@spots\n\n@mega\n\n";
}







for (my $i = 1; $i <= 13; $i++) {


my $five	= &Pick5();
my $meg		= &PickM();




my @unsort 	= ();
my @sort	= ();


@unsort	= split(/\-/, $five);
@sort = sort { $a <=> $b } @unsort;


my $xline	= join("-", @sort);

print "$xline, $meg\n";

my $work	= join("-", $five, $meg);

@spots	=	();
@mega	=	();


my $x		= &PatternX($work);

#	print "SPOTS:\n\n@spots\n\n@mega\n\n";

# print "$x\n";


}

















# Pick Five numbers from @spots

sub Pick5 {

	my @group	= ();

	my $a1	= $spots[ rand @spots ];
	my $a2	= $spots[ rand @spots ];
	my $a3	= $spots[ rand @spots ];
	my $a4	= $spots[ rand @spots ];
	my $a5	= $spots[ rand @spots ];


	my $line = join("-", $a1, $a2, $a3, $a4, $a5);



##################

# Rack set.
push @group, $a1, $a2, $a3, $a4, $a5;

my $line2 = &RackSet(@group);

if ($line2 ne "dull") {

	$line = $line2;
	return($line);

	} else {

	&Pick5();

	}



##################
#	print "$line\n";


}






# pick one number from @mega


sub PickM {
	my $m1	= $mega[ rand @mega ];
	# print "$m1\n";

	return($m1);

}
















sub PatternX {
	my $line = shift;

	my @uniq1	= ();
	my @uniq2	= ();
	my @group2	= ();

	my ($a, $b, $c, $d, $e, $f) = split(/\-/, $line);


	push @group2, $a, $b, $c, $d, $e;



	#	print "GROUPX: @group\n\n";


	foreach my $itema (@group2) {

		$gate1{$itema} = "x";
}


		$gate2{$f}	= "x";




my @gateway1	= values(%gate1);
my @gateway2	= values(%gate2);


foreach my $val (@gateway1) {

	if ($val eq "x") {

		#skip;

	} else {


	push @uniq1, $val;


	}
}



foreach my $val2 (@gateway2) {

	if ($val2 eq "x") {

		#skip;

	} else {

		push @uniq2, $val2;

	}

}



undef %gate1;
undef %gate2;
undef @spots;
undef @mega;

foreach my $l (@uniq1) {
	$gate1{$l}	= $l;

}

foreach my $ll (@uniq2) {

	$gate2{$ll} 	= $ll;

}


@spots	= values(%gate1);
@mega	= values(%gate2);


# print "DATA:\n@spots\n\n@mega\n\n";


my $status = "Success!!";

return($status);



}





sub RackSet {
        my @list = @_;
                # print "LIST: @list\n";
                my %seen        = ();
                my @uniq1       = ();
                foreach my $item (@list) {
                #       print "ITEM: $item\n";
                        unless($seen{$item}) {
                                $seen{$item}    = "1";
                                push (@uniq1, $item);
                        }
                }

                my $count       = @uniq1;
                # print "Count: $count\n";
                if ($count == "5") {
                        my @sorted = sort { $a <=> $b } @uniq1;
                        my $string = join("-", @sorted);
                        return $string;
                } else {
                        return("dull");
                }
}








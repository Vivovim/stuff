#!/usr/bin/perl -w
## Fri Dec  1 22:44:30 MST 2023
## Christopher neo@ctopher.me

use strict;






my $day	        = "22";
my $month     	= "12";
my $year       = "1970";







my $date = "$day\-$month\-$year";





&RackSet($date);


&StackSet($date);





sub StackSet() {

	my $date	= shift;

	my $value = "0";
	my $x	= "0";

my ($a1, $a2, $a3) = split(/\-/, $date);


my @data1	= split(//, $a1);
my @data2	= split(//, $a2);
my @data3	= split(//, $a3);



my @group 	= ();

push @group, @data1, @data2, @data3;


foreach my $item (@group) {

#	print "Item: $item\t";

	$value += $item;

#	print "\n\n";

}


my @set		= split(//, $value);

foreach my $v (@set) {

	$x += $v;

}



print "Value: $value, $x\n"; 



}











sub RackSet() {


my $date = shift;




my ($d1, $d2, $d3) = split(/-/, $date);

# print "$d1,$d2,$d3\t";

my $G1 = "";
my $G2 = "";

if ($d1 == "11" || $d1 == "22" || $d1 == "33") {

	$G1 = $d1;

} else {


my ($S1, $S2)	= split(//, $d1);
$G1 = $S1 + $S2;


}

# print "$G1\n";



if ($d2 == "11" || $d2 == "22" || $d2 == "33") {

		$G2 = $d2;

} else {

my ($S3, $S4)	= split(//, $d2);
$G2 = $S3 + $S4;


}


# print "$G2\n";






my ($S5, $S6, $S7, $S8)	= split(//, $d3);

my $G3 = $S5 + $S6 + $S7 + $S8;

# print "$G3\n";




my $num	= $G1 + $G2 + $G3;

# print "Num: $num\n";



if ($num == "11" || $num == "22" || $num == "33") {

	print "$num\t";


} else {


my ($a, $b) = split(//, $num);

	my $here = $a + $b;

	print "$here\t";


}










print "\n";






}


#!/usr/bin/perl
## Wed Sep 19 20:12:41 PDT 2012
## Christopher ctopher@me.com
## this file, 2024, 5 - 31





use strict;


my %writeup = (

	'a' => "1",
	'b' => "2",
	'c' => "3",
	'd' => "4",
	'e' => "5",
	'f' => "6",
	'g' => "7",
	'h' => "8",
	'i' => "9",
	'j' => "1",
	'k' => "2",
	'l' => "3",
	'm' => "4",
	'n' => "5",
	'o' => "6",
	'p' => "7",
	'q' => "8",
	'r' => "9",
	's' => "1",
	't' => "2",
	'u' => "3",
	'v' => "4",
	'w' => "5",
	'x' => "6",
	'y' => "7",
	'z' => "8",

);


###############################
### Lower Case for all names.
### otherwise, it won't work.


my $first	= "alexander";
my $middle	= "thomas";
my $last	= "flynn";

my $full	= $first . $middle . $last;

my @vowels	= ();

my @constants = ();












# my $name = <@ARGV>;

my @Set = ();

push @Set, $first, $middle, $last;


my $scores	= "0";





my $scoreX	= &GenX($full);

print "Full Name: $scoreX\n\n\n";




foreach my $data (@Set) {

	$scores +=	&GenX($data);

}


	my ($catch1, $catch2) = split(//, $scores);

	my $delta	= $catch1 + $catch2;


	print "Total Score: $scores\n\n\n";




while ($full =~ /([aeiouy])/g) {

	push @vowels, $1;
}

my $vowels = join(/\ /, @vowels);

my $delta1 = &GenX($vowels);



# print "Vowels: @vowels\n";



while( $full =~ /([bcdfghjklmnpqrstvwxz])/g) {

	push @constants, $1;
}

my $constants = join(/\ /, @constants);

my $delta2	= &GenX($constants);


# print "Constants: @constants\n";


print "\n\nLife Path: $delta\/$scores\/$scoreX\n\n";
print "Soul: $delta1\n";
print "Personality: $delta2\n";




sub GenX {

my $name = shift;



my @list = split(//, $name);
my @data = ();


print "@list\n";

foreach my $val (@list) {
	my $d1	= $writeup{$val};
	push @data, $d1;
#	print "$d1\n";

}


my $total = "0";

foreach my $val2 (@data) {

	$total += $val2;

}


print "Total: $total\n";

if ($total == "11" || $total == "22" || $total == "33") {


print "$total\n";

return($total);


} else {




my @group = ();


@group	= split(//, $total);

my $fun	= "0";

foreach my $set (@group) {

	$fun += $set;


	}


print "Fun: $fun\n";

my $G1 = "0";

if ($fun == "11" || $fun == "22" || $fun == "33") {

        $G1 = $fun;

} else {


my ($S1, $S2)   = split(//, $fun);

print "DATA: $S1, $S2\n";


$G1 = $S1 + $S2;


}

 print "$G1\n";

	return($G1);
}

}




exit(0);




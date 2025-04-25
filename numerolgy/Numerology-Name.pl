#!/usr/bin/perl
## Wed Sep 19 20:12:41 PDT 2012
## Christopher ctopher@me.com
## this file, 2024, 5 - 31
## ChatGPT Cleaned this file up. 4/9/2025. @22:00




use strict;


my %writeup = (

	'a' => 1,
	'b' => 2,
	'c' => 3,
	'd' => 4,
	'e' => 5,
	'f' => 6,
	'g' => 7,
	'h' => 8,
	'i' => 9,
	'j' => 1,
	'k' => 2,
	'l' => 3,
	'm' => 4,
	'n' => 5,
	'o' => 6,
	'p' => 7,
	'q' => 8,
	'r' => 9,
	's' => 1,
	't' => 2,
	'u' => 3,
	'v' => 4,
	'w' => 5,
	'x' => 6,
	'y' => 7,
	'z' => 8,

);


###############################
### Lower Case for all names.
### otherwise, it won't work.


my $first	= "neo";
my $middle	= "ctopher";
my $last	= "";

my $full	= $first . $middle . $last;

my @vowels	= ();

my @constants = ();



print "$first, $middle, $last\n";








# my $name = <@ARGV>;

my @Set = ();

push @Set, $first, $middle, $last;


my $scores	= 0;





my $scoreX	= &GenX($full);

print "Full Name: $scoreX\n\n\n";




foreach my $data (@Set) {

	$scores +=	&GenX($data);

}



my $delta = 0;
$delta += $_ for split(//, $scores);



#	my ($catch1, $catch2) = split(//, $scores);
#	my $delta	= $catch1 + $catch2;


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


print "Life Path: $delta\/$scores\/$scoreX\n\n";
print "Soul: $delta1\n";
print "Personality: $delta2\n";



sub GenX {
    my $name = shift;
    my @chars = split //, $name;
    my $total = 0;

    foreach my $char (@chars) {
        if (exists $writeup{$char}) {
            $total += $writeup{$char};
        }
    }

    # Master number check
    return $total if $total == 11 || $total == 22 || $total == 33;

    # Reduce the total
    my $sum = 0;
    $sum += $_ for split(//, $total);

    return $sum if $sum == 11 || $sum == 22 || $sum == 33;

    my $final = 0;
    $final += $_ for split(//, $sum);

    return $final;
}








exit(0);




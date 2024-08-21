#!/Users/ctopher/perlX/bin/perl -w

use strict;
use Time::Local;
use lib qw();
use JSON qw( );
use Data::Dumper;
use Math::Trig;



system("/Users/ctopher/bin/SE-01-ShowEnd.pl");

print "\n\n";



#########		Set Persons Birthday here. Jan = 0;

sub Me {

my $second              = "00";
my $minute              = "42";
my $hour                = "1";
my $day                 = "1";
my $month               = "00";
my $year                = "1970";

my $birthday    = timelocal($second, $minute, $hour, $day, $month, $year);

# print "BirthDay - $birthday\n";

# system("date -r $birthday");


return $birthday;


}


my $file	= "/Users/ctopher/bin/Planets.json";

my $json_text	= do {
	open (my $FH, $file) || die "Sorry Dave $file $!";

local $/;
<$FH>

};

my %data = ();

my $json	= JSON->new();
my $data	= $json->decode($json_text);



my @inner = qw( Mercury Venus Earth Mars );
my @outer = qw( Jupiter Saturn Uranus Neptune Pluto );


my @list	= (0..360);
my %hash	= ();


foreach my $item (@list) {
	my $var		= $item / 360;
	$var		= sprintf("%.2f", $var);
	$hash{$var} = $item;
#	print "$var\n";
}





###############################################
my $pi			= 3.141592653589;
my $JDEpoch		= "2447891.5";
my $Time		= time;

my $jd		= jtime($Time);
my $days	= currentJD($jd, $JDEpoch);

# print "$jd\n\n$days\n\n";


# print "Julian Day: $jd\n\n";
# print "Total Days: $days\n\n";


my $time	= time;
my $dob		= Me();

my $dobJ	= jtime($dob);

# print "$dobJ\n\n";





system("date -r $dob");
system("date -r $time");
# print scalar(localtime($time)) . "\n";

 foreach my $planet (@inner) {
		my ($at, $d1) = PlanetX($jd, $dobJ, $planet);
#		print "$planet\t\t$d1\t\t$at\n";
		print "$planet\t\t$at\n";
 }




foreach my $planet (@outer) {

		my ($at, $d1) = PlanetX($jd, $dobJ, $planet);
#		print "$planet\t\t$d1\t\t$at\n";
		print "$planet\t\t$at\n";

}

my $moon2		= "27.321661";				# Sidereal
my $moon		= "29.530589";				# synodic


my $MDay = $jd - $dobJ;


my $md	= $MDay / $moon;
my $md2	= $MDay / $moon2;


# print "Moon:\t\t$md2\t\t$md\n";
print "Moon:\t\t$md\n";




sub PlanetX {
	my $Dday	= shift;
	my $dob		= shift;
	my $planet	= shift;


	my $days = $Dday - $dob;	

	# days / orbit = where
	my $orbit	= $data->{$planet}[0]{orbit};
	my $set		= $days / $orbit;
#	print "$set\t";


	my $np	= (360 / 365.256363) * $set;

#	print "NP: $np\t";

	my $e	= $data->{$planet}[0]{Long};
	my $m	= $data->{$planet}[0]{LongP};
	my $a	= $data->{$planet}[0]{Semi};
	my $ee	= $data->{$planet}[0]{Eccent};


#	print "Planet: $planet; $e, $m, $a, $ee\n";


	return($set, $np);



}






sub currentJD {
	my $jd	= shift;
	my $ep	= shift;
	my $now	= $jd - $ep;
	return $now;
}



sub jtime {
	my $t = shift;
	my ($julian);
	$julian = ($t / 86400) + 2440587.5;	# (seconds /(seconds per day)) + julian date of epoch
	return ($julian);
}

sub fixDegree {
	my $var = shift;

	while(1) { last if $var >=   0; $var += 360 }
	while(1) { last if $var < 360; $var -= 360 }

	return $var;

}

sub todeg	{ return ($_[0] * (180.0 / $pi)); }						# rad->deg

sub num2dec {
        my $var = shift;
        if ( $var >= 0) {
                my $x =  abs($var);
                my $f1 = floor($x);
                my $f2 =  $x - $f1;
                return $f2;
        } else {
                my $x =  abs($var);
                my $f1 = floor($x);
                my $f2 =  $x - $f1;
                my $f5 = -$f2;
                return $f5;
        }
}


sub floor {
  my $val   = shift;
  my $neg   = $val < 0;
  my $asint = int($val);
  my $exact = $val == $asint;

  return ($exact ? $asint : $neg ? $asint - 1 : $asint);
}








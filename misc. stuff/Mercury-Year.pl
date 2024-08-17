#!/Users/ctopher/perlX/bin/perl -w



use Astro::Montenbruck::Ephemeris::Planet qw/$ME/; # import Mercury identifier
use Astro::Montenbruck::Ephemeris qw/find_positions/;

use strict;


# my $time	= time;
my $time	= 1706771622;
my $stime	= $time + 31536000;

my @sets	= ();
my @ends	= ();

&searchM($time, $stime);


my $count = @ends;
my $xt	= 1;
my $num = 0;

while ($xt == 1) {

	my $retro = shift(@sets);
	my $direct = shift(@ends);

#	print "$retro\t";
#	print "$retro\t$direct\n";

	my $data = scalar(localtime($retro));
	print "$data\t";


	# print "$direct\t";
	my $data2	= scalar(localtime($direct));
	print "$data2\n";

	$num++;

	if ($num >= $count) { $xt = 2; }

}



sub searchM {
	my $start	= shift;
	my $stop	= shift;
	my $inc		= 300;
	my $date;
	my $box		= 0;
	my $jump	= 6048000;
	my $found	= 0;

	$date = $start;

	my $i = 1;
	my $xi = 1;

	my $check1	= "0";

	
	while ($i == 1) {
		my $jd;
		$jd		= jtime($date);
			#my $jdate= jtime($date);
		my $t  = ($jd - 2451545) / 36525; # Convert Julian date to centuries since epoch 2000.0

		find_positions($t, [$ME], sub {
			my ($id, $lambda, $beta, $delta, $motion) = @_;
			if ($motion < 0) {
				if ($check1 == 0) {
						$check1 = 1;
				}
			if ($box == 0) {

			push @sets, $date;
			$box	= 1;
			}

			} else {

			if ($check1 == 0) {

			} else {	

				push @ends, $date;
				$found	= 1;

			}
		}

		}, with_motion => 1);



		$date += $inc;
		$xi++;

		if ($box == 1 && $found == 1) { $date += $jump; $check1 = 0; $box = 0; $found = 0;}

		if ($date >= $stop) { $i = 2; }

	}

}





sub jtime {

        my $t = shift;
        my ($julian);
        $julian = ($t / 86400) + 2440587.5;	# (seconds /(seconds per day)) + julian date of epoch
        return ($julian);

}



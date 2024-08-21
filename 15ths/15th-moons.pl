#!/usr/bin/perl -w
## Tue Jun 15 17:22:11 MST 2021
## Christopher neo@ctopher.me

use strict;
use Time::Local;
use Time::localtime;
use DateTime;
use Astro::MoonPhase qw( phase ); 

my $time	= time;


	my ($s1, $m2, $h1, $d1, $m1, $y1, $wd, $yd, $isday)	= gmtime($time);


my $yearx	= $y1+1900;
my $monthx	= $m1+1;

my $sec		= "00";
my $min		= "55";
my $hour	= "23";
my $month	= $monthx;
my $day		= "15";
my $year	= $yearx; 


my @group	= (0..11);


my %hash	= ();

$hash{0} = "Jan";
$hash{1} = "Feb";
$hash{2} = "Mar";
$hash{3} = "Apr";
$hash{4} = "May";
$hash{5} = "Jun";
$hash{6} = "Jul";
$hash{7} = "Aug";
$hash{8} = "Sep";
$hash{9} = "Oct";
$hash{10} = "Nov";
$hash{11} = "Dec";





foreach my $item (@group) {

	my $t	= timegm($sec, $min, $hour, $day, $item, $year);
	print "$hash{$item}\t";
	my $target	= moon($t);
	print "$target\n";
}











sub moon {

my $cc = shift;
my ($moonphase, $moonillum, $moonage, $moondist, $moonang, $sundist, $sunang) = phase($cc);
return "Moon Age: $moonage\n";

}






exit(0);



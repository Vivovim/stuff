#!/usr/bin/perl -w
## Tue Jun 15 17:22:11 MST 2021
## Christopher neo@ctopher.me

use strict;
use Time::Local;
use Time::localtime;
use DateTime;

my $time	= time;


	my ($s1, $m2, $h1, $d1, $m1, $y1, $wd, $yd, $isday)	= gmtime($time);


my $yearx	= $y1+1900;
my $monthx	= $m1+1;

my $sec		= "00";
my $min		= "00";
my $hour	= "00";
my $month	= $monthx;
my $day		= "15";
my $year	= $yearx;


my %hash	= ();

$hash{1} = "January";
$hash{2} = "February";
$hash{3} = "March";
$hash{4} = "April";
$hash{5} = "May";
$hash{6} = "June";
$hash{7} = "July";
$hash{8} = "August";
$hash{9} = "September";
$hash{10} = "October";
$hash{11} = "November";
$hash{12} = "December";


print "\nThe 15th falls on the following days in $year\n";
print "\"And that is never a good day\" - Laura Croft\n";


for (my $monthd	= 1; $monthd < 13; $monthd++) {
my $dt		= DateTime->new(year => $year, month => $monthd, day => $day);
my $current	= $dt->day_name;
print "$hash{$monthd}, $current\n";

}




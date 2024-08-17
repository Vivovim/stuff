#!/usr/bin/perl -w
## Tue Dec 18 15:14:01 PST 2012
## Christopher ctopher@me.com

use strict;
use Time::Local;

my ($t1, $t2, $t3, $t4, $t5, $t6, $t7, $t8, $t9)	= (localtime)[0,1,2,3,4,5,6,7,8];

# set month and year right!!
$t8 = $t8 + "1";
$t5 = $t5 + "1";
$t6 = $t6 + "1900";

my $Total	= "365";

my $leap	= $t6 % "4";


 if ($leap == "0" && $t8 > "60") {

# 	$t8 = $t8 + "1";
 	$Total	= "366";
 } else {
 	$Total		= "365";
 }

&DOY($t8);
&Goal($t8);
# &EpochA();

my $revolution	= &EpochB();

&Call_God($revolution);


my $var_end	= "206" - $t8;
my $var_eh	= $var_end * "86400";
my $var_002		= commify($var_eh);
# print "\nvar: $var_002\n\n";
###########################################


my $Set_END	= &EpochB();

my $Here	= time;

my $SL		= $Set_END - $Here;


&Jokes($SL);

# print "Seconds Left: $SL\n\n\n";

&Final_01($SL);






###########################################

# date functions

sub Jokes {

my $SL		= shift;

our ($seconds, $minutes, $hours, $day, $month, $year) = (localtime)[0,1,2,3,4,5];

if ($day > "30") {

	$day = "30";
}

$year		= $year + "1900";
my $time	= timelocal($seconds, $minutes, $hours, $day, $month, $year);

my $setT	= $time;
my $setC	= commify($setT);

my $MN		= $setT / "60";
my $HR		= $MN / "60";
my $DY		= $HR / "24";
my $YR2		= $DY / "365";
my $YR		= $t6 - "1970";
my $Weeks	= $DY / "7";
my $MTHS	= $DY / "30";



my $MN2		= commify($MN);
my $HR2		= commify($HR);
my $DY2		= commify($DY);

&EpochA();

print "Time:\n\tYears:\t\t$YR2\n\tMonths:\t\t$MTHS\n\tWeeks:\t\t$Weeks\n\tDays:\t\t$DY2\n\tHours:\t\t$HR2\n\tMinutes:\t$MN2\n\tSeconds:\t$setC\n\n";

# my $var_TD	= $setT + $var_eh;
# my $var_003		= commify($var_TD);

print "Seconds Left: $SL\n\n";


my $total	= $SL + $setT;

print "Total: $total\n";


}







sub EpochA {

my $second		= "00";
my $minute		= "00";
my $hour		= "00";
my $day			= "01";
my $month		= "0";
my $year		= "1970";

my $epocha	= timelocal($second, $minute, $hour, $day, $month, $year);


system("date -r $epocha");
print "$epocha\n";

return $epocha;


}

sub EpochB {

my $second		= "00";
my $minute		= "00";
my $hour		= "00";
my $day			= "25";
my $month		= "6";
my $year		= "2017";

my $epochb	= timelocal($second, $minute, $hour, $day, $month, $year);


# system("date -r $epochb");
# print "$epochb\n";

return $epochb;


}

sub Call_God {

my $epochb	= shift;
# system("date -r $epochb");
# print "$epochb\n";


}



###########################################





sub Goal {

        my $doy = shift;
        my $new = "";


        if ($doy == "206") {
                $new = "Objective!!";
                &Dday($new);
        }

        if ($doy > "206") {
                $new = ($Total - $doy) + "206";
                &Dday($new);
          } 

        if ($doy < "206") {
                $new = "206" - $doy;
                &Dday($new);
        }

}

sub Dday {
        my $new = shift;
        print "Wow: $new\n";
}


sub DOY {

	my $doy = shift;
	print "DoY: $doy\n";

	my $totalD	= "365";

	my $ddayd	= $totalD - $doy;

	# print "Remaining: $ddayd\n";
}



sub Final_01 {

my $SL			= shift;

my $second		= "42";
my $minute		= "13";
my $hour		= "5";
my $day			= "17";
my $month		= "5";
my $year		= "2001";

my $lasttime		= timelocal($second, $minute, $hour, $day, $month, $year);

my $now			= time;
my $end			= $now - $lasttime;
my $test		= &commify($end);


my $hrs			= $end / "60";
my $n2			= $hrs / "60";
my $dys			= $n2 / "24";
my $yrs			= $dys / "365";

my $dy2			= &commify($dys);

my $this	= $now - $end;
my $that	= $SL;

my $w2		= $that / "86400";

my $why		= sprintf("%.4f", $w2);


# print "This is That:$now:-->$why:<--- $that\n";


}



sub commify {
    my $text = reverse $_[0];
    $text =~ s/(\d\d\d)(?=\d)(?!\d*\.)/$1,/g;
    return scalar reverse $text;
}




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
my $HEADS		= &EpochA();



my $var_end	= "206" - $t8;
my $var_eh	= $var_end * "86400";
my $var_002		= commify($var_eh);
# print "\nvar: $var_002\n\n";
###########################################


my $Set_END	= &EpochB();

my $Here	= time;

my $SL		= $Set_END - $Here;


&Jokes($Set_END);

# print "Seconds Left: $SL\n\n\n";

&Final_01($Set_END);






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


&Call_God2($HEADS);

print "Time:\n\tYears:\t\t$YR2\n\tMonths:\t\t$MTHS\n\tWeeks:\t\t$Weeks\n\tDays:\t\t$DY2\n\tHours:\t\t$HR2\n\tMinutes:\t$MN2\n\tSeconds:\t$setC\n\n";

# my $var_TD	= $setT + $var_eh;
# my $var_003		= commify($var_TD);




my $SL2		= $SL - $time;


my $setE	= $SL2;
my $setC2	= commify($setE);

my $MN3		= $setE / "60";
my $HR3		= $MN3 / "60";
my $DY3		= $HR3 / "24";
my $YR4		= $DY3 / "365";
my $Weeks2	= $DY3 / "7";
my $MTHS2	= $DY3 / "30";
my $YR5		= ($MTHS2 / 12);



my $MN4		= commify($MN3);
my $HR4		= commify($HR3);
my $DY4		= commify($DY3);

my $CH		= commify($SL2);

&Call_God($revolution);

print "Time:\n\tYears:\t\t$YR5\n\tMonths:\t\t$MTHS2\n\tWeeks:\t\t$Weeks2\n\tDays:\t\t$DY4\n\tHours:\t\t$HR4\n\tMinutes:\t$MN4\n\tSeconds:\t$CH\n\n";




my $ST	= commify($SL2);
print "Seconds Left: $ST\n\n";


my $total	= $SL2 + $setT;

my $total2	= commify($total);

print "Total: $total2\n";


}







sub EpochA {

my $second		= "00";
my $minute		= "00";
my $hour		= "00";
my $day			= "01";
my $month		= "0";
my $year		= "1970";

my $epocha	= timelocal($second, $minute, $hour, $day, $month, $year);


# system("date -r $epocha");
# print "$epocha\n";

return $epocha;


}

sub EpochB {

my $second		= "00";
my $minute		= "00";
my $hour		= "00";
my $day			= "19";
my $month		= "0";
my $year		= "2038";

my $epochb	= timelocal($second, $minute, $hour, $day, $month, $year);


# system("date -r $epochb");
# print "$epochb\n";

return $epochb;


}

sub Call_God {
my $epochb	= shift;
system("date -r $epochb");
print "$epochb\n";
}

sub Call_God2 {
my $epocha	= shift;
system("date -r $epocha");
print "$epocha\n";
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
my $minute		= "03";
my $hour		= "0";
my $day			= "1";
my $month		= "0";
my $year		= "1970";

my $lasttime		= timelocal($second, $minute, $hour, $day, $month, $year);

my $now			= time;
my $end			= $SL - $now;
my $test		= &commify($end);


my $hrs			= $end / "60";
my $n2			= $hrs / "60";
my $dys			= $n2 / "24";
my $yrs			= $dys / "365";

my $dy2			= &commify($dys);


my $why		= $end / "86400";



print "This is That:$now:-->$why:<--- $end\n";


}



sub commify {
    my $text = reverse $_[0];
    $text =~ s/(\d\d\d)(?=\d)(?!\d*\.)/$1,/g;
    return scalar reverse $text;
}




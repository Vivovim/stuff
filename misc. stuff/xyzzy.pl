#!/usr/bin/perl
## Fri Aug  3 16:36:19 PDT 2012
## Christopher ctopher@mac.com

use strict;




### Want this to work in my world.


print "Going out tonight? Select your destination before you leave!!\n";






my %clubs = (

	"1" => "Gothic",
	"2" => "Dance",
	"3" => "Entertainment",
	"4" => "Cafe",
	"5" => "Flying Solo",
	"26" => "Stay here",
	"52" => "exit",
);

&Lol();


sub Lol {

my @keys = sort {$a <=> $b} keys %clubs;

	foreach my $key (@keys) {
		print "$key $clubs{$key}\n"
	}
}




# print "$clubs{$answer}\n";


my %Cafe = (

	"1" => "Nicks",
	"2" => "DT",
	"3" => "Smoking Java",
	"4" => "The Blue Falcon",
	"5" => "The E-Bar"
);

my %Gothic = (

	"1" => "Dance Lessons",
	"2" => "Order of Dead",
	"3" => "Dark Thrown",
	"4" => "Reprise",
	"5" => "Night Forest"
);


my %Solo = (

	"1" => "Ocean",
	"2" => "Mountains",
	"3" => "Forest",
	"4" => "Desert",
	"5" => "On A Rock"
);

our %Exit_State = (

	"26" => "Stay Here!!",
	"52" => "Exit",
	"69" => "Poison Ivy Vi"
);




&Scene();


sub Scene {


	print "Speak Club Name: ";
	print "fun> ";

	my $answer = "";
	chomp( $answer = <STDIN> );

if ($answer == "1") {

	print "Please Choose an option: \n";
	my @g_keys = sort keys %Gothic;
	foreach my $key (@g_keys) {
		print "$key: $Gothic{$key}\n";
	}
	print "fun> ";

	my $answer1 = '';
	chomp( $answer1 = <STDIN> );
	my $find = $Gothic{$answer1};

	print "your now at: $find, Gothic Nights\n";
	&Club_State();

} 


if ($answer == "4") {

	print "Please choose a cafe: \n";
	my @cafes = sort keys %Cafe;
	foreach my $key (@cafes) {
		print "$key: $Cafe{$key}\n";
	}

	print "fun> ";

	my $answer2 = '';
	chomp( $answer2 = <STDIN> );
	my $find = $Cafe{$answer2};


	print "your now at $find Cafe\n";

	&Club_State();


} 

if ($answer == "5") {

	print "Please Choose an option: \n";
	my @g_keys = sort keys %Solo;
	foreach my $key (@g_keys) {
		print "$key: $Solo{$key}\n";
	}
	print "fun> ";

	my $answer1 = '';
	chomp( $answer1 = <STDIN> );
	my $find = $Solo{$answer1};

	print "your now at: $find, Solo Adventures\n";
	&Club_State();

} 






if ($answer == "52") {

	print "Contine option Terminate connection? (True / False) \n";
	my $status = "";
	print "exit> ";

	chomp ($status = <STDIN>);
	if ($status eq "True") {
		print "Connection Terminated!!\n\n";
		exit(0);
	 } else {

		&Scene();
	}

}

if ($answer == "26") {
	print "your good here for now\n";
	&Club_State();
}



if ($answer != "1" && $answer != "4" && $answer != "26")  {
	print "Your now at $clubs{$answer} club\n";
	&Club_State();

}



}

















&Club_State();




sub Club_State {

my $status = "";

	print "Please Choose an option: \n";
	my @g_keys = sort keys %Exit_State;
	foreach my $key (@g_keys) {
		print "$key: $Exit_State{$key}\n";
	}
	print "Exit? > ";


print "type or speak: \"exit\" to return home\n";
print "Club State> ";


chomp( $status = <STDIN> );


	if ($status eq "Poison Ivy Vi") {
		&Lol();

		&Scene();
	}


	if ($status eq "26") {
		print "your good for now!!\n";
		&Scene();
	}


	if ($status eq "52") {
		print "Your Now Home!!\n";
		exit(0);	
	}


	if ($status eq "69") {

		&Lol();
		&Scene();

	}




	if ($status eq "exit") {
		print "Your now home.\n";
		exit;
	} else {
		&Club_State();
	}
}





exit(0);




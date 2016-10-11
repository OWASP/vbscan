#!/usr/bin/perl

use Term::ANSIColor;

print color("YELLOW");
print q{
  _  _  ____  ___   ___    __    _  _
 ( \/ )(  _ \/ __) / __)  /__\  ( \( )
  \  /  ) _ <\__ \( (__  /(__)\  )  (
   \/  (____/(___/ \___)(__)(__)(_)\_)
};
   	print color("red") . "\t\t(1337.today)" . color("reset");
   	print "
   
    --=[". color("BLUE") . "OWASP VBScan". color("reset") ."
    +---++---==[Version : "
   	. color("red"). "$version\n". color("reset") . "    +---++---==[Update Date : [". color("red") . "$update". color("reset") . "]
    +---++---==[Author : ". color("red") . "Mohammad Reza Espargham". color("reset")."
    +---++---==[Website : ". color("red") . "www.reza.es". color("reset")."
    --=[Code name : ". color("red") . "$codename". color("reset")."\n     \@OWASP_VBScan , \@rezesp , \@OWASP\n\n";
    	
if(!defined $ARGV[0]){
 
    print color("cyan");
    printf "\n   Usage: \n \t$0 <target>\n";
    printf "\t$0 http://target.com/vbulletin\n\n";
    printf "\n   Options: \n";
    printf "\t$0 --help\n\n";
    print color("reset");
    exit(1);
}

#Start help Function
if(($ARGV[0] =~ m/--help/i))
{
	printf "   Usage: \n \t$0 <Target>\n";
	printf "\t$0 http://target.com/vbulletin\n\n";
	printf "   About Author \n \t$0 --about\n\n   Check for Upgrade : \n \t$0 --upgrade\n\n\n";
	print color("reset");
	exit(1);
}elsif($ARGV[0] =~ m/--about/i)
{
	print color("cyan");
	printf "
   Author      :   $author
   Linkedin    :   https://ir.linkedin.com/in/rezasp
   E-Mail      :   me\@reza.es , reza.espargham\@gmail.com
   Website     :   www.reza.es
   Twitter     :   https://twitter.com/rezesp
   FaceBook    :   https://www.facebook.com/reza.espargham
   SourceForge :   https://sourceforge.net/projects/vbscan/
   Github      :   https://github.com/rezasp/vbscan/
    \n\n";
	print color("reset");
	exit(1);
}elsif($ARGV[0] =~ m/--upgrade/i)
{
	printf "  Update Function ... ;)\n\n\n\n";
    do "core/upgrade.pl";
	print color("reset");
	exit(1);
}


#End help Function

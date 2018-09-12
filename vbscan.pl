#!/usr/bin/perl
#
#            --------------------------------------------------
#                              OWASP VBScan
#            --------------------------------------------------
#        Copyright (C) <2018>  <(Mohammad Reza Espargham)>
#
#        This program is free software: you can redistribute it and/or modify
#        it under the terms of the GNU General Public License as published by
#        the Free Software Foundation, either version 3 of the License, or
#        any later version.
#
#        This program is distributed in the hope that it will be useful,
#        but WITHOUT ANY WARRANTY; without even the implied warranty of
#        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#        GNU General Public License for more details.
#
#        You should have received a copy of the GNU General Public License
#        along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#

$author="Mohammad Reza Espargham";$author.="";
$version="0.1.8";$version.="";
$codename="Self Challenge";$codename.="";
$update="2018/09/13";$update.="";

system(($^O eq 'MSWin32') ? 'cls' : 'clear');
use if $^O eq "MSWin32", Win32::Console::ANSI;
use Term::ANSIColor;
use Cwd;                                                                       
$mepath = Cwd::realpath($0); $mepath =~ s#/[^/\\]*$##; 

$SIG{INT} = \&interrupt;
sub interrupt {
    fprint("\nShutting Down , Interrupt by user");
    do "$mepath/core/report.pl";
    print color("reset");
    exit 0;
} 
do "$mepath/core/header.pl";
do "$mepath/core/main.pl";
do "$mepath/modules/firewall.pl";
do "$mepath/core/ver.pl";
do "$mepath/exploit/verexploit.pl";
do "$mepath/modules/passlogger.pl";
do "$mepath/modules/license.pl";
do "$mepath/modules/pathdisclure.pl";
do "$mepath/modules/dirlisting.pl";
do "$mepath/modules/missconfig.pl";
do "$mepath/modules/cpfinder.pl";
do "$mepath/modules/cpupgrade.pl";
do "$mepath/modules/validator.pl";
do "$mepath/modules/robots.pl";
do "$mepath/modules/c99finder.pl";
do "$mepath/modules/backupfinder.pl";
do "$mepath/modules/errfinder.pl";
do "$mepath/modules/configfinder.pl";
do "$mepath/exploit/faq.pl";
do "$mepath/exploit/vbseo.pl";
do "$mepath/exploit/xperience.pl";
do "$mepath/exploit/upexploit.pl";
do "$mepath/exploit/arcade.pl";
do "$mepath/exploit/regplug.pl";
do "$mepath/exploit/tapatalk.pl";
do "$mepath/exploit/routestring.pl";
do "$mepath/exploit/openredirection.pl";
do "$mepath/exploit/yui.pl";
do "$mepath/exploit/htmlcode.pl";
do "$mepath/exploit/decodearguments.pl";


do "$mepath/core/report.pl";
print color("reset");

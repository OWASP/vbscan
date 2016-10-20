#!/usr/bin/perl
#
#            --------------------------------------------------
#                            OWASP VBScan
#            --------------------------------------------------
#        Copyright (C) <2015>  <(Mohammad Reza Espargham)>
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
# About Project Leader :
#
#    Project Leader     :   Mohammad Reza Espargham
#    Linkedin    :   https://ir.linkedin.com/in/rezasp
#    E-Mail      :   me@reza.es , reza.espargham@gmail.com , reza.espargham@owasp.org
#    Twitter     :   https://twitter.com/rezesp
#    SourceForge :   https://sourceforge.net/projects/vbscan/
#    Github      :   https://github.com/rezasp/vbscan/

$author="Mohammad Reza Espargham";$author.="";
$version="0.1.7.1";$version.="";
$codename="Larry Wall";$codename.=""; # https://en.wikipedia.org/wiki/Larry_Wall <3
$update="2016/10/21";$update.="";

system(($^O eq 'MSWin32') ? 'cls' : 'clear');
use if $^O eq "MSWin32", Win32::Console::ANSI;
use Term::ANSIColor;


$SIG{INT} = \&interrupt;
sub interrupt {
    fprint("\nShutting Down , Interrupt by user");
    do "./core/report.pl";
    print color("reset");
    exit 0;
}
do "./core/header.pl";
do "./core/main.pl";
do "./modules/firewall.pl";
do "./core/ver.pl";
do "./exploit/verexploit.pl";
do "./modules/license.pl";
do "./modules/pathdisclure.pl";
do "./modules/dirlisting.pl";
do "./modules/missconfig.pl";
do "./modules/cpfinder.pl";
do "./modules/cpupgrade.pl";
do "./modules/validator.pl";
do "./modules/robots.pl";
do "./modules/c99finder.pl";
do "./modules/backupfinder.pl";
do "./modules/errfinder.pl";
do "./modules/configfinder.pl";
do "./exploit/faq.pl";
do "./exploit/vbseo.pl";
do "./exploit/xperience.pl";
do "./exploit/upexploit.pl";
do "./exploit/arcade.pl";
do "./exploit/yui.pl";
do "./exploit/htmlcode.pl";
do "./exploit/decodearguments.pl";

do "./core/report.pl";
print color("reset");

#!/usr/bin/perl

#Coded By Mohammad Reza Espargham
#VBScan
#ver : 0.1.1

#i hate switch case :) just if/else/elsif

print "\n[+] Updating ...\n";
$x=`pwd`;
chomp($x);
`cd /tmp;git clone https://github.com/rezasp/vbscan.git`;
`cp -R /tmp/vbscan/ \"$x\"`;
`rm -rf /tmp/vbscan/`;


print "[+] Update was completed successfully\n";
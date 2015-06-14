#!/usr/bin/perl

#Coded By Mohammad Reza Espargham
#VBScan
#ver : 0.1.1

#i hate switch case :) just if/else/elsif

use LWP::UserAgent;
use LWP::Simple;
use Term::ANSIColor;
print color("blue");

$ua = LWP::UserAgent ->new;
$ua->timeout(15);
$ua->agent('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)');
$ua->requests_redirectable(undef);


chomp($target=$ARGV[0]);

if($target !~ /http:\/\//) { $target = "http://$target"; };







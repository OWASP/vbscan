#!/usr/bin/perl

#Coded By Mohammad Reza Espargham
#VBScan
#ver : 0.1.3

#i hate switch case :) just if/else/elsif


use LWP::UserAgent;
use LWP::Simple;
use Term::ANSIColor;
print color("blue");

$ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
$ua->protocols_allowed( [ 'http','https'] );
$ua->agent('Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36');
$ua->requests_redirectable(undef);


chomp($target=$ARGV[0]);

if($target !~ /http/) { $target = "http://$target"; };

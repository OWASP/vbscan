#!/usr/bin/perl
#OWASP VBScan


use utf8;
use open ':std', ':encoding(UTF-8)';
use LWP::UserAgent;
use LWP::Simple;
use Term::ANSIColor;
print color("blue");

$ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
$ua->protocols_allowed( [ 'http','https'] );
$ua->timeout(180);
$ua->agent('Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36');


chomp($target=$ARGV[0]);

if($target !~ /http/) { $target = "http://$target"; };

our $log="";
sub dprint{
    my ($in) = @_;
    $in="\n[+] $in\n";
    $log .= $in;
    print color("blue");
    print "$in";
}
sub tprint{
    my ($in) = @_;
    $in="[++] $in\n";
    $log .= $in;
    print color("yellow");
    print "$in";
    print color("blue");
}
sub fprint{
    my ($in) = @_;
    $in="[++] $in\n";
    $log .= $in;
    print color("red");
    print "$in";
    print color("blue");
}

print $log;
#start Checking error.log
$ertf=0;
print "\n[+] Finding common log files name\n";
my $response = $ua->get("$target/error.log");
if ($response->status_line =~ /200/g) {
    print color("yellow");
    print "[++] error.log path : $target/error.log\n";
    print color("blue");
    $ertf=1;
}
my $response = $ua->get("$target/error_log");
if ($response->status_line =~ /200/g) {
    print color("yellow");
    print "[++] error_log path : $target/error_log\n";
    print color("blue");
    $ertf=1;
}
if($ertf==0) {
    print color("red");
    print "[++] error log is Not Found :(\n";
    print color("blue");
}
#end Checking error.log

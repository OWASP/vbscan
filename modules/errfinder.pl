#start Checking error.log
$ertf=0;
dprint("Finding common log files name");
$response = $ua->get("$target/error.log");
if ($response->status_line =~ /200/g) {
    tprint("error.log path : $target/error.log");
    $ertf=1;
}
$response = $ua->get("$target/error_log");
if ($response->status_line =~ /200/g) {
    tprint("error_log path : $target/error_log");
    $ertf=1;
}
if($ertf==0) {
    fprint("error log is not found\n");
}
#end Checking error.log

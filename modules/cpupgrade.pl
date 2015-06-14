#start Checking upgrade.php to find admincp
if($amtf==1){
    print "\n[+] Checking upgrade.php to find admincp\n";
    my $response = $ua->get("$target/install/upgrade.php");
    if ($response->status_line =~ /200/g) {
        $source=$response->decoded_content;
        $source =~ /ADMINDIR = \"\.\.\/(.*?)\"\;/;
        if($1 != ""){
            print color("yellow");
            print "[++] admincp exist $target/$1\n";
            print color("blue");
        }else{goto np;}
    } else {
        np:;
        print color("red");
        print "[++] upgrade.php Not Found :(\n";
        print color("blue");
    }
}
#end Checking upgrade.php to find admincp

#start Checking upgrade.php to find admincp
if($amtf==1){
    dprint("Checking upgrade.php to find admincp");
    my $response = $ua->get("$target/install/upgrade.php");
    if ($response->status_line =~ /200/g) {
        $source=$response->decoded_content;
        $source =~ /ADMINDIR = \"\.\.\/(.*?)\"\;/;
        if($1 != ""){
            tprint("admincp exist $target/$1");
        }else{goto np;}
    } else {
        np:;
        fprint("upgrade.php not found");
    }
}
#end Checking upgrade.php to find admincp

#start admincp/modcp
dprint("Checking admincp/modcp path");

$source=$ua->get("$target/admincp/index.php")->decoded_content;
if($source =~ m/Admin Control Panel/i || $source =~ m/form action="..\/login.php?do=login"/i || $source =~ m/ADMINHASH/i){
    tprint("admincp Found\n$target/admincp");
}else{
    fprint("admincp does not exist or renamed");
    $amtf=1;
}
$source=$ua->get("$target/modcp/index.php")->decoded_content;
if($source =~ m/Moderator Control Panel/i || $source =~ m/form action="..\/login.php?do=login"/i || $source =~ m/ADMINHASH/i){
    tprint("modcp Found\n$target/modcp");
}else{
    fprint("modcp does not exist or renamed");
}
#end admincp/modcp

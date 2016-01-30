#start xml c99 shell
$ctf=0;
dprint("Checking c99 xml shell in admincp/subscriptions.php");
$source=$ua->get("$target/admincp/subscriptions.php?do=api")->decoded_content;
if($source =~ m/c99shell/i || $source =~ m/shell/i){
    tprint("c99 shell is found\n shell path : $target/admincp/subscriptions.php?do=api");
}else{
    fprint("c99 xml shell is Not Found");
}
#end xml c99 shell

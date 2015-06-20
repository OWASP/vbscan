#start xml c99 shell
$ctf=0;
print "\n[+] Checking c99 xml shell in admincp/subscriptions.php\n";
$source=$ua->get("$target/admincp/subscriptions.php?do=api")->decoded_content;
if($source =~ m/c99shell/i || $source =~ m/c99/i || $source =~ m/shell/i){
    print color("yellow");
    print "[++] c99 shell is found\n shell path : $target/admincp/subscriptions.php?do=api\n";
    print color("blue");
}else{
    print color("red");
    print "[++] c99 xml shell is Not Found:(\n";
    print color("blue");
}
#end xml c99 shell

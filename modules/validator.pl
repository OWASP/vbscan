#start validator checker
print "\n[+] Checking validator.php\n";

$source=$ua->get("$target/validator.php")->decoded_content;
if($source =~ m/validate/i){
    print color("yellow");
    print "[++] validator.php is found \n you can find all vbulletin files and directories path for seeking important data (Backup , Databases , Shell , etc) \n validator path : $target/validator.php\n";
    print color("blue");
}else{
    print color("red");
    print "[++] validator.php is not found\n";
    print color("blue");
}
#end validator checker

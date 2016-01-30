#start validator checker
dprint("Checking validator.php");

$source=$ua->get("$target/validator.php")->decoded_content;
if($source =~ m/validate/i){
    tprint("validator.php is found \n you can find all vbulletin files and directories path for seeking important data (Backup , Databases , Shell , etc) \n validator path : $target/validator.php");
}else{
    fprint("validator.php is not found");
}
#end validator checker

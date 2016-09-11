#start admincp/modcp
dprint("Checking admincp/modcp path");
$adtext="";
$source=$ua->get("$target/admincp/index.php")->decoded_content;
if($source =~ m/Admin Control Panel/i || $source =~ m/form action="..\/login.php?do=login"/i || $source =~ m/ADMINHASH/i){
   $adtext.="admincp Found\n$target/admincp";
}else{
    $adtext.="admincp does not exist or renamed";
    $amtf=1;
}
$source=$ua->get("$target/modcp/index.php")->decoded_content;
if($source =~ m/Moderator Control Panel/i || $source =~ m/form action="..\/login.php?do=login"/i || $source =~ m/ADMINHASH/i){
    $adtext.="\n[++] modcp Found\n$target/modcp";
}else{
    $adtext.="\n[++] modcp does not exist or renamed";
    $mmtf=1;
}
if(!($amtf==1 || $mmtf==1)){
    tprint($adtext);
}else{
    fprint($adtext);
}
#end admincp/modcp

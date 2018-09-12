#start Vbulletin password logger Detecting
dprint("Vbulletin password logger Detecting");
$source=$ua->get("$target/")->decoded_content;
if($source =~ m/vb_login_md5password_utf\, \)/i || $source =~ m/vb_login_md5password_utf\,\)/i){
	tprint("This website has been password logger and store user's password as cleartext");
}else{
	fprint("Password logger not found");
}
#end password logger Detecting
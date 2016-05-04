#start license
$response=$ua->get("$target/attachment/");
$source=$response->decoded_content;
if ($source =~ /<title>Index of/g) {
	tprint("attachment directory has directory listing : \n$target/attachment/");
}
#end license
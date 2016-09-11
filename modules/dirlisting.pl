#start license
$response=$ua->get("$target/attachment/");
$source=$response->decoded_content;
if ($source =~ /<title>Index of/g) {
	dprint("Directory Listing");
	tprint("attachment directory has directory listing : \n$target/attachment/");
}
#end license
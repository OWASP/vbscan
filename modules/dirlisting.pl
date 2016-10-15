#start Directory Listing
$response=$ua->get("$target/attachment/");
$source=$response->decoded_content;
if ($source =~ /<title>Index of/g or $source =~ /Last modified<\/a>/g) {
	dprint("Directory Listing");
	tprint("attachment directory has directory listing : \n$target/attachment/");
}
#end Directory Listing
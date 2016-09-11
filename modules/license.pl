#start license
$response=$ua->get("$target/LICENSE");
my $headers  = $response->headers();
my $content_type =$headers->content_type();
$source=$response->decoded_content;
if ($response->status_line =~ /200/g and $content_type =~ /text/g and $source =~ /vBulletin License Agreement/g) {
	dprint("vBulletin LICENSE Check");
	tprint("vBulletin LICENSE file : $target/LICENSE\n");
}
#end license

#start fw detector
dprint('Detecting Vbulletin based Firewall');
$uatmp=$ua->agent();

$ua->agent("Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.5) Gecko/20060719 Firefox/1.5.0.5");

$source=$ua->get("$target")->decoded_content;
if($source =~ m/dnp_firewall/i || $source =~ m/DnP Firewall/i || $source =~ m/dnp_fw/i){
	tprint("Vbulletin DnP Firewall is detected\n DNP Firewall home page : http://www.silveryhat.com/dnp-firewall/\n");
	print color("yellow");
	print "[++] Trying to bypass firewall with user agent method\n";
	print color("blue");

	@UserAgent = (
		'Googlebot',
		'msnbot',
		'slurp',
		'fast-webcrawler',
		'Googlebot-Image',
		'teomaagent1',
		'directhit',
		'lycos',
		'ia_archiver',
		'gigabot',
		'whatuseek',
		'Teoma',
		'scooter',
		'Ask Jeeves',
		'slurp@inktomi',
		'gzip(gfe) (via translate.google.com)',
		'Mediapartners-Google',
		'crawler@alexa.com'
	);
	foreach $Agent(@UserAgent)
	{
		chomp($Agent);
		$ua->agent($Agent);
		$source=$ua->get("$target")->decoded_content;
		if($source !~ m/dnp_firewall/i and $source !~ m/DnP Firewall/i and $source !~ m/dnp_fw/i){
			print color("yellow");
			print "[++] Firewall bypassed by setting \"$Agent\" as default user agent\n";
			print color("blue");
			goto dnpen;
		}
	}
 	

}else{
	fprint("No known firewall detected");
	$ua->agent($uatmp);
	goto dnpen;
}
print color("red");
print "[++] User agent bypass method not working\n";
print color("blue");
$ua->agent($uatmp);
dnpen:;

#end fw detector

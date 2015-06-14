#start Version finder
print "\n[+] Processing $target ...\n\n[+] Detecting vBulletin Version\n";


$source=$ua->get("$target/clientscript/vbulletin_global.js")->decoded_content;
$source =~ /ulletin (.*?)\n/;
$ver="vBulletin $1";
if($ver !~ m/\./i){
$source=$ua->get("$target/clientscript/vbulletin-core.js")->decoded_content;
$source =~ /ulletin (.*?)\n/;
$ver="vBulletin $1";
}
if($ver !~ m/\./i){
$source=$ua->get("$target/clientscript/vbulletin_menu.js")->decoded_content;
$source =~ /ulletin (.*?)\n/;
$ver="vBulletin $1";
}
if($ver !~ m/\./i){
$source=$ua->get("$target")->decoded_content;
$source =~ /meta name=\"generator\" content=\"(.*?)\" \/>/;
$ver=$1;
}
if($ver !~ m/\./i){
    $source =~ /Powered by(.*?)br/;
    $ver=$1;
    $ver =~ s/\<//g;$ver =~ s/&reg;//g;$ver =~ s/Version //g;
}


if($ver !~ m/\./i){print color("red");$ver="ver 404 ;)";}else{print color("yellow");}
print "[++] vBulletin Version :  $ver\n";
print color("blue");

#end Version finder

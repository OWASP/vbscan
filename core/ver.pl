#start Version finder
dprint("Processing $target ...\n\n[+] Detecting vBulletin Version");

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


if($ver !~ m/\./i){fprint("vBulletin Version : ver 404\n")}else{tprint("vBulletin Version :  $ver\n");}


#end Version finder

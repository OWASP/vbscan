#start Version finder
dprint("Processing $target ...\n\n");

$source=$ua->get("$target/")->decoded_content;
if (($source =~ m/vbulletin/i || $source =~ m/Vbulletin/i || $source =~ m/vBulletin/i))
{print "";}else{
    print color("red");
    print "[++] The target is alive! But is not running on vbulletin.\nDo you want to continue? [y/N] ";
    $inp=<STDIN>;
    if($inp =~ /N/g || $inp =~ /n/g){
        print color("reset");
        exit 0;
    }
}

$ua->requests_redirectable(undef);


dprint("Detecting vBulletin Version");

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
    $source =~ /vbulletinlink\">vBulletin\&reg\;\<\/a\> (.*?)br/;
    $ver=$1;
    $ver =~ s/\<//g;$ver =~ s/&reg;//g;$ver =~ s/Version /vBulletin /g;
}
if($ver !~ m/\./i){
    $source =~ /Powered by(.*?)br/;
    $ver=$1;
    $ver =~ s/\<//g;$ver =~ s/&reg;//g;$ver =~ s/Version //g;
}

$ver =~ tr/[0-9][a-z][A-Z][\.]\ //cd;

if($ver !~ m/\./i){fprint("vBulletin Version : ver 404\n")}else{tprint("vBulletin Version :  $ver\n");}


#end Version finder

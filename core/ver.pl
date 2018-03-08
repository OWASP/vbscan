#start Version finder
@pa = ("$target/clientscript/vbulletin_global.js","$target/clientscript/vbulletin-core.js","$target/clientscript/vbulletin_menu.js","$target/");

foreach $lin(@pa){
    $source=$ua->get($lin)->decoded_content;
    if (($source =~ m/vbulletin/i || $source =~ m/Vbulletin/i || $source =~ m/vBulletin/i))
    {goto len;}
}
print color("red");
print "[++] The target is alive! But is not running on vbulletin.\nDo you want to continue? [y/N] ";
$inp=<STDIN>;
if($inp =~ /N/g || $inp =~ /n/g){
    print color("reset");
    exit 0;
}
len:;
$source =~ /ulletin (.*?)\n/;
$ver="vBulletin $1";
if($ver !~ m/\./i){
$source=$ua->get("$target/clientscript/vbulletin-core.js")->decoded_content;
$source =~ /ulletin (.*?)\n/;
$ver="vBulletin $1";
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
if($ver !~ m/\./i){
    $source=$ua->get("$target")->decoded_content;
    $source =~ /SIMPLEVERSION = \"(.*?)\"/; 
    $verss="$1";
    $one= substr $verss ,0,1;
    $two= substr $verss ,1,1;
    $three= substr $verss ,2,1;
    $ver= "vBulletin $one.$two.$three";
}
$ver =~ tr/[0-9][a-z][A-Z][\.]\ //cd;
if( $ver =~ /\d\.\d\.\d+/ and length($ver) > 25) {$ver= "vBulletin $&";}  
if($ver !~ m/\./i){fprint("ver 404\n")}else{tprint("$ver\n");}

#end Version finder
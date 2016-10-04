#start config.php.x check
$incl="includes";

#vbulletin 5.x
 my $bver=substr($ver, index($ver, ' ')+1, 1);
 $bver =~ s/ //g;
if($bver=~m/5/i){
    $incl="core/includes";
}


$ctf=0;
dprint("Checking config.php.x for disclure config file");
@configs = ('config.php~','config.php.new','config.php.new~','config.php.old','config.php.old~','config.bak','config.php.bak','config.php.bkp','config.txt','config.php.txt','config - Copy.php','config.php.swo','config.php_bak','config.php#','config.orig','config.php.save','config.php.original','config.php.swp','config.save','.config.php.swp','config.php1','config.php2','config.php3','config.php4','config.php4','config.php6','config.php7','config.phtml');

my $cnftmp="";
foreach $config(@configs){
    $source=$ua->get("$target/$incl/$config")->decoded_content;
    if($source =~ m/admincpdir/i || $source =~ m/dbtype/i || $source =~ m/technicalemail/i){
        $cnftmp="$cnftmp\Readable config file is found \n config file path : $target/$incl/$config\n";
        $ctf=1;
    }
}
if($ctf==0){
    fprint("Readable config files are not found");
}else{
    tprint($cnftmp);
}
#end config.php.x check

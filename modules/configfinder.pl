#start config.php.x check
$ctf=0;
dprint("Checking config.php.x for disclure config file");
@configs = ('config.php~','config.php.new','config.php.new~','config.php.old','config.php.old~','config.bak','config.php.bak','config.php.bkp','config.txt','config.php.txt','config - Copy.php');
foreach $config(@configs){
    $source=$ua->get("$target/includes/$config")->decoded_content;
    if($source =~ m/admincpdir/i || $source =~ m/dbtype/i || $source =~ m/technicalemail/i){
        tprint("Readable config file is found \n config file path : $target/includes/$config");
        $ctf=1;
    }
}
if($ctf==0){
    fprint("Readable config files are not found");
}
#end config.php.x check

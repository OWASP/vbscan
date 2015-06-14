#start config.php.x check
$ctf=0;
print "\n[+] Checking config.php.x for diclure config file\n";
@configs = ('config.php~','config.php.new','config.php.new~','config.php.old','config.php.old~','config.bak','config.php.bak','config.php.bkp','config.txt','config.php.txt','config - Copy.php');
foreach $config(@configs){
    $source=$ua->get("$target/includes/$config")->decoded_content;
    if($source =~ m/admincpdir/i || $source =~ m/dbtype/i || $source =~ m/technicalemail/i){
        print color("yellow");
        print "[++] Readable config file is found \n config file path : $target/includes/$config\n";
        print color("blue");
        $ctf=1;
    }
}
if($ctf==0){
    print color("red");
    print "[++] Readable config files are Notfound :(\n";
    print color("blue");
}
#end config.php.x check

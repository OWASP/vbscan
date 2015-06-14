#start find backup
$btf=0;
print "\n[+] Finding common backup files name\n";
@configs = ('backup.zip','upload.zip','vb.zip','forum.zip','forum.tar','forum.tar.gz','backup.tar.gz','2.zip','1.zip','database.zip','sql.zip','backup.sql','database.sql');
foreach $config(@configs){
    $response=$ua->get("$target/$config");
    if ($response->status_line =~ /200/g) {
        print color("yellow");
        print "[++] Backup file is found \nPath : $target/$config\n";
        print color("blue");
        $btf=1;
    }
}
if($btf==0){
    print color("red");
    print "[++] Backup files are Notfound :(\n";
    print color("blue");
}
#end find backup

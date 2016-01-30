#start find backup
$btf=0;
dprint("Finding common backup files name");
@configs = ('backup.zip','upload.zip','vb.zip','forum.zip','forum.tar','forum.tar.gz','backup.tar.gz','2.zip','1.zip','database.zip','sql.zip','backup.sql','database.sql');
foreach $config(@configs){
    $response=$ua->get("$target/$config");
    if ($response->status_line =~ /200/g) {
        tprint("Backup file is found \nPath : $target/$config");
        $btf=1;
    }
}
if($btf==0){
    fprint("Backup files are not found");
}
#end find backup

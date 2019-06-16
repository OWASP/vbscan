#start find backup
$btf=0;
dprint("Finding common backup files name");
@backups = ('1.zip', '2.zip', 'admincp.zip', 'backup.sql', 'backup.tar.gz', 'backup.zip', 'database.sql', 'database.zip', 'files.zip', 'forum.tar', 'forum.tar.gz', 'forum.zip', 'forums.zip', 'includes.zip', 'sql.zip', 'upload.zip', 'vb.zip');
foreach $back(@backups){
    if (($content_type, $doc_length, $mod_time, $expires, $server) =head("$target/$back")){
        if($content_type !~ m/text\/html/i){
            tprint("Backup file is found \nPath : $target/$back\n");
           $btf=1;
        }
    }
}
if($btf==0){
    fprint("Backup files are not found");
}
#end find backup

#start path disclosure

@plinks = ("forumdisplay.php?do[]=[test.dll]","calendar.php?do[]=[test.dll]","search.php?do[]=[test.dll]","forumrunner/include/album.php","core/vb5/route/channel.php","core/vb5/route/conversation.php","includes/api/interface/noncollapsed.php","includes/api/interface/collapsed.php","vbseo_sitemap/addons/vbseo_sm_vba.php","vbseo_sitemap/addons/vbseo_sm_vba_links.php");
foreach $plink(@plinks){
    $source=$ua->get("$target/$plink")->decoded_content;
    if($source =~ m/Cannot modify header information/i || $source =~ m/trim()/i || $source =~ m/class_core.php/i || $source =~ m/header already sent/i|| $source =~ m/Fatal error/i){
        $pathdis="";
        $source =~ /array given in (.*?) on line/;
        $pathdis=$1;
        if($pathdis !~ ""){
            $source =~ /array given in (.*?) on line /;
            $pathdis=$1;
        }
        if($pathdis !~ ""){
            $source =~ /occurred in (.*?) in line /;
            $pathdis=$1;
        }
        if($pathdis !~ ""){
            $source =~ /occurred in (.*?) on line/;
            $pathdis=$1;
        }
        if($pathdis !~ ""){
            $source =~ /on a non-object in (.*?) on line/;
            $pathdis=$1;
        }
        if($pathdis !~ ""){
            $source =~ /on a non-object in (.*?) in line/;
            $pathdis=$1;
        }
        if($pathdis !~ ""){
            $source =~ /No such file or directory (errno 2) in (.*?) on line/;
            $pathdis=$1;
        }    
        if($pathdis !~ ""){
            $source =~ /No such file or directory in (.*?) in line/;
            $pathdis=$1;
        }
   
         $pathdis =~ s/<b>//g;
         $pathdis =~ s/<\/b>//g;
         $pathdis =~ s/<strong>//g;
         $pathdis =~ s/<\/strong>//g;
        dprint("Full Path Disclosure (FPD)");
        tprint("Full Path Disclosure (FPD) in '$target/$plink' : $pathdis");
        goto pend;
    }
}
pend:;

#end path disclosure
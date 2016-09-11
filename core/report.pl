our $target="$target/";

$html="";
open(my $fh, '<:encoding(UTF-8)', "core/tmpreport.html");
while (my $row = <$fh>) {
  chomp $row;
  $html.=$row;
}

#localtime
@weekday = ("Sunday", "Monday", "Tuesday", "Wednesday", "thursday", "Friday", "Saturday");
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();;
$year = $year + 1900;
$mon += 1;
$ftime="$mday/$mon/$year $hour:$min:$sec $weekday[$wday]";

#replace info
$html =~ s/\$target/$target/g;
$html =~ s/\$codename/$codename/g;
$html =~ s/\$version/$version/g;
$html =~ s/\$ftime/$ftime/g;
$html =~ s/\$stime/$stime/g;
$html =~ s/\$vbversion/$ver/g;

#htmltmp
$tmpbody='<tr>
  <td>
    <pre></pre>
    <h3 onclick="vbscan(\'vbreport$i\', this); return false;" title="Open Details" style="color:$color">[+] $title </h3>
    <pre></pre>
    <p id="vbreport$i" >$datail</p>
    <pre></pre>
  </td>
</tr>';

#txtlog
if($target =~ /http:\/\/(.*?)\//){our $li=$1;}
if($target =~ /https:\/\/(.*?)\//){our $li=$1;}
$tmptarget="$1";
mkdir "reports/$tmptarget";

open(my $fh, '>', "reports/$tmptarget/$tmptarget\_report\_$year-$mon-$mday\_at\_$hour.$min.$sec.txt");
our $log="$log";
print $fh "$log";
close $fh;


#htmllog
for($i=0;$i<=$#dlog;$i++){
  if($i==1){next;}
  $tbody=$tmpbody;
  $tbody =~ s/\$i/$i/g;
  $tflog[$i] =~ s/\n/\n\<br\>/g;
  if($tflog[$i] =~ m/1337false/i){$color="red";}else{$color="green";}
  $tflog[$i]  =~ s/1337false//g;
  if ($can_regexp) {
    $tflog[$i]  =~ s( ($RE{URI}{HTTP}) ) (<a href="$1" target="_blank" style="color:inherit">$1</a>)gx ;
  }
  $tflog[$i]  =~ s/\[\+\+\] //g;
  $tbody =~ s/\$color/$color/g;
  

  $tbody =~ s/\$datail/$tflog[$i]/g;
  $dlog[$i]  =~ s/Checking for//g;
  $dlog[$i]  =~ s/Checking //g;
  $dlog[$i]  =~ s/Detecting //g;
  $dlog[$i]  =~ s/Finding //g;

  $tbody =~ s/\$title/$dlog[$i]/g;

  $body.=$tbody;  
}

$html =~ s/\$body/$body/g;





open(my $fh, '>', "reports/$tmptarget/$tmptarget\_report\_$year-$mon-$mday\_at\_$hour.$min.$sec.html");
print $fh "$html";
close $fh;


print color("yellow");
print "\n\nYour Report : reports/$tmptarget/\n";

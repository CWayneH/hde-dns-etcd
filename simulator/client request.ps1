# http://127.0.0.1:30001/hdSimu/ASI/index.html?perf=2
$url1 = "http://192.168.0.180:30001/hdSimu/"
$url2 = "http://192.168.0.190:30001/hdSimu/"
$url3 = "http://192.168.0.200:30001/hdSimu/"
$url4 = "http://192.168.0.210:30001/hdSimu/"
$url5 = "http://192.168.0.220:30001/hdSimu/"
$url6 = "http://192.168.0.230:30001/hdSimu/"
$url7 = "http://192.168.0.240:30001/hdSimu/"
$url8 = "http://192.168.0.250:30001/hdSimu/"
$url_a = $url1, $url2
$url_b = $url3, $url4, $url5
$url_c = $url6, $url7, $url8
$reg1 = "USA/"
$reg2 = "EUR/"
$reg3 = "ASI/"
$reg = $reg1, $reg2, $reg3
$srv1 = "index.html"
$srv2 = "app"
$srv3 = "fileupload"
$srv = $srv1, $srv2, $srv3
$pf1 = "?perf=0"
$pf2 = "?perf=1"
$pf3 = "?perf=2"
$pf = $pf1, $pf2, $pf3
<#
while ($true) {
	$url = $url1, $url2 | Get-Random;
	$r = $r1, $r2, $r3 | Get-Random;
	$srv = $srv1, $srv2 | Get-Random;
	$pf = $pf1, $pf2, $pf3 | Get-Random;
	# totally GET method in simplify
	$data = Invoke-RestMethod $url$r$srv$pf;
	if (($data.scores | Measure -Min).Minimum-gt0) 
	{
		Write-Output "---data---"
		Write-Output $data
	}
	else 
	{
		return $false
	}
}
#>
function random_curl {
	$u = $args[0] | Get-Random
	$r = $args[1] | Get-Random
	$s = $args[2] | Get-Random
	$p = $args[3] | Get-Random
	Invoke-RestMethod $u$r$s$p
}
for($i=0;$i-lt10;$i++){
	# totally GET method in simplify
	random_curl $url_a $reg $srv $pf;
	random_curl $url_b $reg $srv $pf;
	random_curl $url_c $reg $srv $pf;
	}

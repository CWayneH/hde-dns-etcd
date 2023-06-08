# http://127.0.0.1:30001/hdSimu/ASI/index.html?perf=2
$url1 = "http://192.168.137.180:30001/hdSimu/"
$url2 = "http://192.168.137.190:30001/hdSimu/"
$url3 = "http://192.168.137.200:30001/hdSimu/"
$url4 = "http://192.168.137.210:30001/hdSimu/"
$url5 = "http://192.168.137.220:30001/hdSimu/"
$url6 = "http://192.168.137.230:30001/hdSimu/"
$url7 = "http://192.168.137.240:30001/hdSimu/"
$url8 = "http://192.168.137.250:30001/hdSimu/"
$url = $url1, $url2, $url3, $url4, $url5, $url6, $url7, $url8
$r1 = "USA/"
$r2 = "EUR/"
$r3 = "ASI/"
$srv1 = "index.html"
$srv2 = "app"
$srv3 = "fileupload"
$pf1 = "?perf=0"
$pf2 = "?perf=1"
$pf3 = "?perf=2"
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
for($i=0;$i-lt10;$i++){
	# totally GET method in simplify
	$pf = $pf1, $pf2, $pf3 | Get-Random;
	$srv = $srv1, $srv2, $srv3 | Get-Random;
	$r = $r1, $r2, $r3 | Get-Random;
	$url = $url1, $url2 | Get-Random;
	$data = Invoke-RestMethod ($url | Get-Random)$r$srv$pf;
	Write-Host $data
	}

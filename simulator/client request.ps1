# http://127.0.0.1:30001/hdSimu/ASI/index.html?perf=2
$url = "http://127.0.0.1:30001/hdSimu/"
$r1 = "USA/"
$r2 = "EUR/"
$r3 = "ASI/"
$srv1 = "index.html"
$srv2 = "app"
$pf1 = "?perf=0"
$pf2 = "?perf=1"
$pf3 = "?perf=2"
while ($true) {
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

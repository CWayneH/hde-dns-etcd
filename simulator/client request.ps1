$url = "http://127.0.0.1:30001/hdSimu/"
$h1 = "host1/"
$h2 = "host2/"
$srv1 = "index.html"
$srv2 = "app"
while ($true) {
	$h = $h1, $h2 | Get-Random;
	$srv = $srv1, $srv2 | Get-Random;
	# totally GET method in simplify
	$data = Invoke-RestMethod $url$h$srv;
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
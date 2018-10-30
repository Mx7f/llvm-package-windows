#param([string]$url,[string]$filename)
$url = $args[0]
$filename = $args[1]
echo "url: $url"
echo "filename: $filename"
(New-Object System.Net.WebClient).DownloadFile($url, $filename)
echo "Downloaded"
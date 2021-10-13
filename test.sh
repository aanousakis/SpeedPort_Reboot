a#!/bin/bash

router_ip='http://192.168.1.254'

username=$(grep -w 'username' credentials.txt |  sed 's_username=__'  )
echo "username = $username"

password=$(grep -w 'password' credentials.txt |  sed 's_password=__'  )
echo "password = $password"



####  open login page

  
 curl 'http://192.168.1.254/' \
  -H 'Connection: keep-alive' \
  -H 'Pragma: no-cache' \
  -H 'Cache-Control: no-cache' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4655.0 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  --compressed \
  --insecure
  
<html>
<head>
	<title>Oxygen Configuration</title>
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate">
	<meta http-equiv="Expires" content="-1">
	<meta http-equiv="Refresh" content="0;url=./user/page.pl">
</head>
<body>
</body>
</html>


curl 'http://192.168.1.254/user/page.pl' \
  -H 'Connection: keep-alive' \
  -H 'Pragma: no-cache' \
  -H 'Cache-Control: no-cache' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4655.0 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Referer: http://192.168.1.254/' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  --compressed \
  --insecure
  
  
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate">
	<meta http-equiv="Expires" content="-1">
	<meta http-equiv="Refresh" content=0;url=/cgi-bin/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	Please <a href='/cgi-bin/'>click here</a> if your browser does not redirect you automatically
</body>
</html>%  

curl -u user:user 'http://192.168.1.254/cgi-bin/' \
  -H 'Connection: keep-alive' \
  -H 'Pragma: no-cache' \
  -H 'Cache-Control: no-cache' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4655.0 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Referer: http://192.168.1.254/user/page.pl' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  --compressed \
  --insecure
  
  <html>
<head>
	<title>Oxygen Configuration</title>
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate">
	<meta http-equiv="Expires" content="-1">
	<meta http-equiv="Refresh" content="0;url=./page.pl">
</head>
<body>
</body>
</html>



curl -c cookies.txt 'http://192.168.1.254/cgi-bin/page.pl' \
  -H 'Connection: keep-alive' \
  -H 'Pragma: no-cache' \
  -H 'Cache-Control: no-cache' \
  -H 'Authorization: Basic dXNlcjp1c2Vy' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4655.0 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Referer: http://192.168.1.254/cgi-bin/' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  --compressed
  
curl -b cookies.txt 'http://192.168.1.254/cgi-bin/page.pl?type=system' \
  -H 'Connection: keep-alive' \
  -H 'Pragma: no-cache' \
  -H 'Cache-Control: no-cache' \
  -H 'Authorization: Basic dXNlcjp1c2Vy' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4655.0 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Referer: http://192.168.1.254/cgi-bin/page.pl?type=status&page=about' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  --compressed \
  --insecure
  
  curl -b cookies.txt 'http://192.168.1.254/cgi-bin/page.pl?type=system&page=restart' \
  -H 'Connection: keep-alive' \
  -H 'Pragma: no-cache' \
  -H 'Cache-Control: no-cache' \
  -H 'Authorization: Basic dXNlcjp1c2Vy' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4655.0 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Referer: http://192.168.1.254/cgi-bin/page.pl?type=system' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  --compressed \
  --insecure
  
  curl -b cookies.txt  'http://192.168.1.254/cgi-bin/page.pl?type=system&page=restart&set_mode=1&redirect_url=/&redirect_keepalive=10' \
  -X 'POST' \
  -H 'Connection: keep-alive' \
  -H 'Content-Length: 0' \
  -H 'Pragma: no-cache' \
  -H 'Cache-Control: no-cache' \
  -H 'Authorization: Basic dXNlcjp1c2Vy' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Origin: http://192.168.1.254' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'User-Agent: Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4655.0 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Referer: http://192.168.1.254/cgi-bin/page.pl?type=system&page=restart' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  --compressed
  
  
  
  
  
  
  

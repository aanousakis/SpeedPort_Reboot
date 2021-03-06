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
  
  
  
  
  
  
  

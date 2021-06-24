#!/bin/bash

router_ip='http://192.168.1.1'

username=$(grep -w 'username' credentials |  sed 's_username=__'  )
echo "username = $username"

password=$(grep -w 'password' credentials |  sed 's_password=__'  )
echo "password = $password"



####  open login page

curl "$router_ip" \
    -H 'User-Agent: Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0' \
    -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' \
    -H 'Accept-Language: en-US,en;q=0.5' \
    --compressed \
    -H "Referer: \"$router_ip\"/" \
    -H 'DNT: 1'\
    -H 'Connection: keep-alive' \
    -H 'Cookie: _TESTCOOKIESUPPORT=1; SID=3a8902b989845b4f50f9693635bf8de21ae3f5bdb7fce58bc217512be7494e68'\
    -H 'Upgrade-Insecure-Requests: 1'\
    -H 'Sec-GPC: 1' \
    -H 'Cache-Control: max-age=0' > login.html


###  extract xmlobject number

xmlobject=$(curl "$router_ip"/function_module/login_module/login_page/logintoken_lua.lua?_=1624531066102   | sed 's_<ajax\_response\_xml\_root>__'  | sed 's_</ajax\_response\_xml\_root>__' )

echo "xmlobject = $xmlobject"


###  create password

echo  "${password}${xmlobject}"
password_sha256=$(echo -n "${password}${xmlobject}" |  sha256sum  | head -c 64)
echo "password_sha256 = $password_sha256"


###   post login request

curl "$router_ip" \
    -H 'User-Agent: Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0' \
    -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' \
    -H 'Accept-Language: en-US,en;q=0.5' \
    --compressed \
    -H 'Content-Type: application/x-www-form-urlencoded' \
    -H "Origin: \"$router_ip\"" \
    -H 'DNT: 1' \
    -H 'Connection: keep-alive' \
    -H "Referer: \"$router_ip\"/" \
    -H 'Cookie: _TESTCOOKIESUPPORT=1; SID=3a8902b989845b4f50f9693635bf8de21ae3f5bdb7fce58bc217512be7494e68' \
    -H 'Upgrade-Insecure-Requests: 1' \
    -H 'Sec-GPC: 1' \
    --data-raw "Username=admin&Password=$password_sha256&action=login"  > post_login.html


###  open main page

curl 'http://192.168.1.1/' \
    -H 'User-Agent: Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0' \
    -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' \
    -H 'Accept-Language: en-US,en;q=0.5' \
    --compressed \
    -H "Referer: \"$router_ip\"/" \
    -H 'DNT: 1' \
    -H 'Connection: keep-alive' \
    -H 'Cookie: _TESTCOOKIESUPPORT=1; SID=3a8902b989845b4f50f9693635bf8de21ae3f5bdb7fce58bc217512be7494e68' \
    -H 'Upgrade-Insecure-Requests: 1' \
    -H 'Sec-GPC: 1' \
    -H 'Cache-Control: max-age=0'  > main_menu.html

###  select Managment tab

curl "$router_ip/getpage.lua?pid=123&nextpage=ManagDiag_StatusManag_t.lp&Menu3Location=0&_=1624535491068" \
    -H 'User-Agent: Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0' \
    -H 'Accept: text/html, */*; q=0.01' \
    -H 'Accept-Language: en-US,en;q=0.5' \
    --compressed \
    -H 'X-Requested-With: XMLHttpRequest' \
    -H 'DNT: 1' \
    -H 'Connection: keep-alive' \
    -H "Referer: \"$router_ip\"/" \
    -H 'Cookie: SID=3a8902b989845b4f50f9693635bf8de21ae3f5bdb7fce58bc217512be7494e68; _TESTCOOKIESUPPORT=1' \
    -H 'Sec-GPC: 1'  > menu1.html


###  select system managment

curl "$router_ip/getpage.lua?pid=123&nextpage=ManagDiag_DeviceManag_t.lp&Menu3Location=0&_=1624535573870" \
    -H 'User-Agent: Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0' \
    -H 'Accept: text/html, */*; q=0.01' \
    -H 'Accept-Language: en-US,en;q=0.5' \
    --compressed \
    -H 'X-Requested-With: XMLHttpRequest' \
    -H 'DNT: 1' \
    -H 'Connection: keep-alive' \
    -H "Referer: \"$router_ip\"/" \
    -H 'Cookie: SID=3a8902b989845b4f50f9693635bf8de21ae3f5bdb7fce58bc217512be7494e68; _TESTCOOKIESUPPORT=1' \
    -H 'Sec-GPC: 1'  > menu2.html

### extract session token from index.html page

grep -w '_sessionTmpToken' menu2.html | tail -1

session_tokken=$(grep -w '_sessionTmpToken' menu2.html | tail -1 |  sed 's_\_sessionTmpToken = __' | sed 's_"__g' |  sed 's_\\x3__g' | sed 's/.$//')
echo "session_token = $session_tokken"


###  post reboot request

curl --max-time 5 "$router_ip/common_page/deviceManag_lua.lua" \
    -H 'User-Agent: Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0' \
    -H 'Accept: application/xml, text/xml, */*; q=0.01' \
    -H 'Accept-Language: en-US,en;q=0.5' \
    --compressed \
    -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
    -H 'X-Requested-With: XMLHttpRequest' \
    -H "Origin: \"$router_ip\"" \
    -H 'DNT: 1' \
    -H 'Connection: keep-alive' \
    -H "Referer: \"$router_ip\"/" \
    -H 'Cookie: _TESTCOOKIESUPPORT=1; SID=3a8902b989845b4f50f9693635bf8de21ae3f5bdb7fce58bc217512be7494e68' \
    -H 'Sec-GPC: 1' \
    --data-raw "IF_ACTION=Restart&Btn_restart=&_sessionTOKEN=$session_tokken"  > reboot.html


### exit

exit 0
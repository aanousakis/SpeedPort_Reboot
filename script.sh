#!/bin/bash

router_ip='192.168.1.1'



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







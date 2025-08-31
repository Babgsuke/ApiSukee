#!/bin/bash

USERNAME=$1
limitipp=$2
expp=$3
koutaa=$4
id=$5


if [ -z "$USERNAME" ] || [ -z "passwd" ]; then
    echo "Error: Username and role are required."
    exit 1
fi

# // Get Bot
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
KEYX="6386703502:AAGiUjNES9aXxBWzuqNTiqDBDqd0uLcGFAs"
CHATIDX="5795571992"
URLX="https://api.telegram.org/bot$KEYX/sendMessage"
clear

export TIME="10"
IP=$(curl -sS ipv4.icanhazip.com)
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
domain=$(cat /etc/xray/domain)
clear

#tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
#none="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do



# . Liner 
function baris_panjang() {
  echo -e "———————————————————————————————————————"
}

function Lunatic_Banner() {
clear
baris_panjang
echo -e "Zsandz TUNNELING"
baris_panjang
}


# // Create Title account



  

echo ""
user=$USERNAME
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
         

			echo ""
			echo -e "\033;91m Name Salah  "
			echo ""


		fi
	done
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
uuid=$(cat /proc/sys/kernel/random/uuid)
echo
Quota=$koutaa
echo
iplimit=$limitipp
echo
masaaktif=$expp
echo






tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json

asu=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF`
grpc=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $asu | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1


cat >/var/www/html/vmess-$user.txt <<-END

———————————————————————————————————————
ZSANDZSCTUNNEL V3
———————————————————————————————————————
# Format Vmess WS TLS

- name: Vmess-$user-WS TLS
  type: vmess
  server: ${domain}
  port: 443
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}

# Format Vmess WS Non TLS

- name: Vmess-$user-WS Non TLS
  type: vmess
  server: ${domain}
  port: 80
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}

# Format Vmess gRPC

- name: Vmess-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vmess
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  network: grpc
  tls: true
  servername: ${domain}
  skip-cert-verify: true
  grpc-opts:
    grpc-service-name: vmess-grpc

———————————————————————————————————————
 Link Akun Vmess                   
———————————————————————————————————————
Link TLS         : 
${vmesslink1}
———————————————————————————————————————
Link none TLS    : 
${vmesslink2}
———————————————————————————————————————
Link GRPC        : 
${vmesslink3}
———————————————————————————————————————

END
if [ ! -e /etc/vmess ]; then
  mkdir -p /etc/vmess
fi

if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/kyt/limit/vmess/ip
echo -e "$iplimit" > /etc/kyt/limit/vmess/ip/$user
else
echo > /dev/null
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/vmess/${user}
fi
DATADB=$(cat /etc/vmess/.vmess.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vmess/.vmess.db
fi
echo "### ${user} ${exp} ${uuid} ${Quota} ${iplimit}" >>/etc/vmess/.vmess.db
clear
CHATID="$CHATID"
KEY="$KEY"
TIME="$TIME"
URL="$URL"
TEXT="<code>———————————————————————————————————————</code>
<code>      XRAY/VMESS</code>
<code>———————————————————————————————————————</code>
<code>Remarks   : ${user}
Domain    : ${domain}
Limit Quota : ${Quota} GB
Port TLS  : 400-900
Port NTLS : 80, 8080, 8081-9999
id        : ${uuid}
alterId   : 0
Security  : auto
network   : ws or grpc
Path      : /Multi-Path
Dynamic   : https://bugmu.com/path
Name      : vmess-grpc</code>
<code>———————————————————————————————————————</code>
<code> VMESS WS TLS</code>
<code>———————————————————————————————————————</code>
<code>${vmesslink1}</code>
<code>———————————————————————————————————————</code>
<code>VMESS WS NO TLS</code>
<code>———————————————————————————————————————</code>
<code>${vmesslink2}</code>
<code>———————————————————————————————————————</code>
<code> VMESS gRPC</code>
<code>———————————————————————————————————————</code>
<code>${vmesslink3}</code>
<code>———————————————————————————————————————</code>
Format OpenClash : https://${domain}:81/vmess-$user.txt
<code>———————————————————————————————————————</code>
Aktif Selama   : $masaaktif Hari
Dibuat Pada    : $tnggl
Berakhir Pada  : $expe
<code>———————————————————————————————————————</code>
"

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
curl -s --max-time $TIMES -d "chat_id=$CHATIDX&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URLX >/dev/null

#cat <<EOF > akun/vmess-$user.json
#{
  #"type": "VMESS XRAY",
 # "remarks": "${user}",
#  "domain": "${domain}",
  #"user_quota": "${Quota} GB",
  #"user_ip": "${iplimit} IP",
#  "port_tls": "400,8443",
#  "port_ws": "80,8880,8080,2082",
#  "key": "${uuid}",
 # "locations": "${CITY}",
#<<  "isp": "${ISP}",
#  "alterid": 0,
#  "security": "auto",
 # "network": "ws",
 # "path": "/vmess",
 # "dynamic Path": "yourbug/vmess",
 # "servicename": "vmess-grpc",
#  "link_tls": "${vmesslink1}",
  #"link_ws": "${vmesslink2}",
 # "link_grpc": "${vmesslink3}",
  #"expiry_on": "${expe}"
#}
#EOF
clear


# Lokasi file JSON
FILE="/etc/akun/$id.json"
mkdir -p "/etc/akun"
# Buat JSON user baru
NEW_USER=$(jq -n \
  --arg user "$user" \
  --arg key "vmess-$Login" \
  --arg type "VMESS XRAY" \
  --arg remarks "$user" \
  --arg domain "$domain" \
  --arg user_quota "${Quota} GB" \
  --arg user_ip "${iplimit} IP" \
  --arg port_tls "400,8443" \
  --arg port_ws "80,8880,8080,2082" \
  --arg key "$uuid" \
  --arg locations "$CITY" \
  --arg isp "$ISP" \
  --arg alterid "0" \
  --arg security "auto" \
  --arg network "ws" \
  --arg path "/vmess" \
  --arg dynamic_path "yourbug/vmess" \
  --arg servicename "vmess-grpc" \
  --arg link_tls "$vmesslink1" \
  --arg link_ws "$vmesslink2" \
  --arg link_grpc "$vmesslink3" \
  --arg expiry_on "$expe" \
  '{($key): {
    type: $type,
    remarks: $remarks,
    domain: $domain,
    user_quota: $user_quota,
    user_ip: $user_ip,
    port_tls: $port_tls,
    port_ws: $port_ws,
    key: $key,
    locations: $locations,
    isp: $isp,
    alterid: ($alterid|tonumber),
    security: $security,
    network: $network,
    path: $path,
    dynamic_path: $dynamic_path,
    servicename: $servicename,
    link_tls: $link_tls,
    link_ws: $link_ws,
    link_grpc: $link_grpc,
    expiry_on: $expiry_on
  }}')

# Jika file belum ada, buat file baru
if [ ! -f "$FILE" ]; then
  echo "$NEW_USER" > "$FILE"
else
  # Jika file sudah ada, tambahkan user baru atau timpa user lama
  jq ". + $NEW_USER" "$FILE" > temp.json && mv temp.json "$FILE"
fi
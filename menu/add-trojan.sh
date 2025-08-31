#!/bin/bash

USERNAME=$1
limitip=$2
expp=$3
koutaa=$4
id=$5

clear
red() { echo -e "\\033[32;1m${*}\"; }
clear
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
red() { echo -e "\\033[32;1m${*}\"; }

# // Get Bot
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
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
# Valid Script
ipsaya=$(curl -sS ipv4.icanhazip.com)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/Zsandz/kiryu/main/izin-ip-sandz"
clear
export TIME="10"
IP=$(curl -sS ipv4.icanhazip.com)
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
domain=$(cat /etc/xray/domain)
clear

#tr="$(cat ~/log-install.txt | grep -w "Trojan WS " | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
  
user="$USERNAME"
		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
clear
			echo ""
			echo -e "${{Red} Sorry Nickname is Ready !  "
			echo ""
			welcome
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
echo
Quota="$koutaa"
echo
iplimit="$limitip"
echo
masaaktif="$expp"
 

tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

# Link Trojan Akun
systemctl restart xray
trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlink="trojan://${uuid}@bugkamu.com:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink2="trojan://${uuid}@${domain}:80?path=%2Ftrojan-ws&security=none&host=${domain}&type=ws#${user}"

cat >/var/www/html/trojan-$user.txt <<-END
———————————————————————————————————————

# Format Trojan GO/WS

- name: Trojan-$user-GO/WS
  server: ${domain}
  port: 443
  type: trojan
  password: ${uuid}
  network: ws
  sni: ${domain}
  skip-cert-verify: true
  udp: true
  ws-opts:
    path: /trojan-ws
    headers:
        Host: ${domain}

# Format Trojan gRPC

- name: Trojan-$user-gRPC
  type: trojan
  server: ${domain}
  port: 443
  password: ${uuid}
  udp: true
  sni: ${domain}
  skip-cert-verify: true
  network: grpc
  grpc-opts:
    grpc-service-name: trojan-grpc
  ———————————————————————————————————————Link Akun Trojan ———————————————————————————————————————Link WS          : ${trojanlink}———————————————————————————————————————Link GRPC        : ${trojanlink1}———————————————————————————————————————
  
END

TEXT="
<code>———————————————————————————————————————</code>
<code>Link Akun Trojan </code>
<code>———————————————————————————————————————</code>
<code>Link WS          : </code>
<code>${trojanlink}</code>
<code>———————————————————————————————————————</code>
<code>Link GRPC        : </code>
<code>${trojanlink1}</code>
<code>———————————————————————————————————————</code>
"



systemctl reload xray
systemctl reload nginx
service cron restart
trojanlink="trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}"
if [ ! -e /etc/trojan ]; then
  mkdir -p /etc/trojan
fi

if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/kyt/limit/trojan/ip
echo -e "$iplimit" > /etc/kyt/limit/trojan/ip/$user
else
echo > /dev/null
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/trojan/${user}
fi
DATADB=$(cat /etc/trojan/.trojan.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/trojan/.trojan.db
fi
echo "### ${user} ${exp} ${uuid} ${Quota} ${iplimit}" >>/etc/trojan/.trojan.db
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL
clear
echo
#cat <<EOF > /etc/akun/trojan-$id.json
#{
#  "type": "TROJAN",
 # "remarks": "${user}",
#  "host": "${domain}",
#  "user_quota": "${Quota} GB",
 # "user_ip": "${iplimit} IP",
 # "port_ntls": "443-900",
#  "port_ws": "80,8880,8080",
  #"key": "${uuid}",
 # "isp": "${ISP}",
  #"path": "/trojan-ws",
 # "servicename": "trojan-grpc",
 # "link_ws": "${trojanlink}",
 # "link_tls": "${trojanlink2}",
#  "link_grpc": "${trojanlink1}",
  #"expiry_on": "${expe}"
#}
#EOF



# Lokasi file JSON
FILE="/etc/akun/$id.json"
mkdir -p "/etc/akun"

# Buat JSON user Trojan baru
NEW_TROJAN=$(jq -n \
  --arg user "$user" \
  --arg key "trojan-$Login" \
  --arg type "TROJAN" \
  --arg remarks "$user" \
  --arg domain "$domain" \
  --arg user_quota "${Quota} GB" \
  --arg user_ip "${iplimit} IP" \
  --arg port_ntls "443-900" \
  --arg port_ws "80,8880,8080" \
  --arg key "$uuid" \
  --arg isp "$ISP" \
  --arg path "/trojan-ws" \
  --arg servicename "trojan-grpc" \
  --arg link_ws "$trojanlink" \
  --arg link_tls "$trojanlink2" \
  --arg link_grpc "$trojanlink1" \
  --arg expiry_on "$expe" \
  '{($key): {
      type: $type,
      remarks: $remarks,
      domain: $host,
      user_quota: $user_quota,
      user_ip: $user_ip,
      port_ntls: $port_ntls,
      port_ws: $port_ws,
      key: $key,
      isp: $isp,
      path: $path,
      servicename: $servicename,
      link_ws: $link_ws,
      link_tls: $link_tls,
      link_grpc: $link_grpc,
      expiry_on: $expiry_on
  }}')

# Jika file belum ada, buat file baru
if [ ! -f "$FILE" ]; then
  echo "$NEW_TROJAN" > "$FILE"
else
  # Jika file sudah ada, gabungkan user baru (replace jika $user sama)
  jq ". + $NEW_TROJAN" "$FILE" > temp.json && mv temp.json "$FILE"
fi
#!/bin/bash

USERNAME=$1
limitipp=$2
expp=$3
koutaa=$4
id=$5


# // Get Bot
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"

export TIME="10"
IP=$(curl -sS ipv4.icanhazip.com)
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
domain=$(cat /etc/xray/domain)
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

domain=$(cat /etc/xray/domain)
clear
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do


  

echo ""
user=$USERNAME
  CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

  if [[ ${CLIENT_EXISTS} == '1' ]]; then
    clear

  echo -e "${Red}         Nickname Is wrong !!  "

    echo ""
    welcome
  fi
done
uuid=$(cat /proc/sys/kernel/random/uuid)
echo
Quota=$koutaa
echo
iplimit=$limitipp
echo
masaaktif=$expp


tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

vlesslink1="vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&encryption=none&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}"
if [ ! -e /etc/vless ]; then
  mkdir -p /etc/vless
fi

if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/kyt/limit/vless/ip
echo -e "$iplimit" > /etc/kyt/limit/vless/ip/$user
else
echo > /dev/null
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/vless/${user}
fi
DATADB=$(cat /etc/vless/.vless.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vless/.vless.db
fi
echo "### ${user} ${exp} ${uuid} ${Quota} ${iplimit}" >>/etc/vless/.vless.db
clear
cat >/var/www/html/vless-$user.txt <<-END

———————————————————————————————————————
SANZSCTUNNEL V3 
———————————————————————————————————————
# Format Vless WS TLS

- name: Vless-$user-WS TLS
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vless
    headers:
      Host: ${domain}

# Format Vless WS Non TLS

- name: Vless-$user-WS (CDN) Non TLS
  server: ${domain}
  port: 80
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vless
    headers:
      Host: ${domain}
  udp: true

# Format Vless gRPC (SNI)

- name: Vless-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: grpc
  grpc-opts:
  grpc-mode: gun
    grpc-service-name: vless-grpc

———————————————————————————————————————
Link Akun Vless 
———————————————————————————————————————
Link TLS      : 
${vlesslink1}
———————————————————————————————————————
Link none TLS : 
${vlesslink2}
———————————————————————————————————————
Link GRPC     : 
${vlesslink3}
———————————————————————————————————————


END

systemctl restart xray
systemctl restart nginx

#cat <<EOF > akun/vless-$user.json
#{
 # "type": "VLESS XRAY",
#  "remarks": "$user",
 # "domain": "$domain",
 # "user_quota": "$Quota",
#  "user_ip": "$iplimit",
 # "port_tls": "443-900",
#  "port_ws": "80,8880,8080",
  #"user_id": "$uuid",
 # "locations": "$CITY",
 # "isp": "$ISP",
  #"encryption": "none",
  #"path_tls": "/vless",
  #"servicename": "vless-grpc",
 # "linkws": "$vlesslink1",
 # "linktls": "$vlesslink2",
 # "linkgrcp": "$vlesslink3",
 # "exp": "$expe"
#}
#EOF


# Lokasi file JSON
FILE="/etc/akun/$id.json"
mkdir -p "/etc/akun"

# Buat JSON VLESS baru
NEW_VLESS=$(jq -n \
  --arg user "$user" \
  --arg key "vless-$Login" \
  --arg type "VLESS XRAY" \
  --arg remarks "$user" \
  --arg domain "$domain" \
  --arg user_quota "$Quota" \
  --arg user_ip "$iplimit" \
  --arg port_tls "443-900" \
  --arg port_ws "80,8880,8080" \
  --arg key "$uuid" \
  --arg locations "$CITY" \
  --arg isp "$ISP" \
  --arg encryption "none" \
  --arg path_tls "/vless" \
  --arg servicename "vless-grpc" \
  --arg linkws "$vlesslink1" \
  --arg linktls "$vlesslink2" \
  --arg linkgrcp "$vlesslink3" \
  --arg exp "$expe" \
  '{($key): {
      type: $type,
      remarks: $remarks,
      domain: $domain,
      user_quota: $user_quota,
      user_ip: $user_ip,
      port_tls: $port_tls,
      port_ws: $port_ws,
      key: $user_id,
      locations: $locations,
      isp: $isp,
      encryption: $encryption,
      path_tls: $path_tls,
      servicename: $servicename,
      linkws: $linkws,
      linktls: $linktls,
      linkgrcp: $linkgrcp,
      exp: $exp
  }}')

# Jika file belum ada, buat file baru
if [ ! -f "$FILE" ]; then
  echo "$NEW_VLESS" > "$FILE"
else
  # Jika file sudah ada, gabungkan user baru atau update user lama
  jq ". + $NEW_VLESS" "$FILE" > temp.json && mv temp.json "$FILE"
fi
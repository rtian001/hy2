# hy2 部署gamehost

> config.yaml
```yaml
listen: :65111

tls:
  cert: "server.crt"
  key: "server.key"

auth:
  type: password
  password: "181156a7-2f9d-529a-ab79-0fd62e5681b1"

masquerade:
  type: proxy
  proxy:
    url: https://bing.com
    rewriteHost: true

```

>server.key
```
-----BEGIN PRIVATE KEY-----
MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQgKAxfOsprBD9NVtSf
msO1MhJzEauun/3WLKVbg/y4FaahRANCAAT35/seVsRuVl7RUlUyRtba92nzjg3R
OZ9EVpe/R2/VKKlS7XXvmKS2481LGM51UgYPy+Pabs/htPdYZOpGYD2S
-----END PRIVATE KEY-----
```
>server.crt
```
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
```
> 执行命令
```
hysteria server
# --disable-update-check
hysteria server -c config
```
-------
> 客户端配置
>
> client_config
>
```
server: "91.185.190.159:65111"
auth: "181156a7-2f9d-529a-ab79-0fd62e5681bc"
tls:
 sni: www.bing.com
 insecure: true
http:
 listen: 127.0.0.1:46064
```
> 执行命令
>
```
hysteria server -c client_config
```

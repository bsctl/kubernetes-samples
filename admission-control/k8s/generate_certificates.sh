#!/usr/bin/env bash
# Credits: https://github.com/stackrox/admission-controller-webhook-demo
openssl req -nodes -new -x509 -keyout ca.key -out ca.crt -subj "/CN=Admission Controller Webhooks CA"
openssl genrsa -out webhook-server-tls.key 2048
openssl req -new -key webhook-server-tls.key -subj "/CN=webhook-server.webhooks.svc" | openssl x509 -req -CA ca.crt -CAkey ca.key -CAcreateserial -out webhook-server-tls.crt
#kubectl -n webhooks create secret tls webhook-server-tls --cert "webhook-server-tls.crt" --key "webhook-server-tls.key"
openssl base64 -A <"ca.crt"
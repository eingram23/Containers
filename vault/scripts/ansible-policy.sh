vault policy write ansible - <<EOF
path "secret/*" {
  capabilities = [ "read" ]
}
EOF
podman run -d --name=vault-dev-server --pod=vault -e VAULT_ADDR='http://0.0.0.0:8200' -e VAULT_DEV_ROOT_TOKEN_ID='token' --cap-add=IPC_LOCK vault:latest

vault auth enable approle
vault write auth/approle/role/ansible token_num_uses=0 token_ttl=0m secret_id_num_uses=0 token_no_default_policy=false token_policies="ansible"
vault auth enable userpass
vault write auth/userpass/users/eingram password=temppassword policies=admins
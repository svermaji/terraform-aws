# Start git console
# go to specific folder (in my case /d/aws), for ssl.conf - refer in files
# MSYS_NO_PATHCONV is for git to avoid path conversion on windows

export MSYS_NO_PATHCONV=1

openssl genrsa -out sv-aws-private-key.pem 4096
openssl rsa -in sv-aws-private-key.pem -pubout > sv-aws-public-key.pub
openssl req -new -x509 -key sv-aws-private-key.pem -days 325 -sha256 -config ssl.conf -subj "/C=GB/ST=SY/L=Sheffield/O=SV/O=AWS/CN=SV AWS" -out sv-aws-cert.cer 

# once you are out of shell MSYS_NO_PATHCONV variable will be unset

# Generate ppk key using winscp from private key as sv-aws-private-key.ppk 
#  - when private key passed winscp itself offers to create ppk
#  - Use ppk to login using putty/winscp 
# Generate public key using puttygen as sv-aws-public-key-kg.pub
# Path of sv-aws-public-key-kg.pub is being used in key-pair script 

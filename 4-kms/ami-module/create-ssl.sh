# run in git bash
# -subj '/CN=localhost'
openssl req -x509 -newkey rsa:4096 -keyout /d/cert/key.pem -out /d/cert/cert.pem -days 365 -nodes

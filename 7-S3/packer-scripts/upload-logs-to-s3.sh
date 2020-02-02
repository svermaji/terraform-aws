aws s3 mv /var/log/httpd s3://sv-s3 --recursive --exclude "*_log" --include "*.gz"

#!/bin/bash
echo "Starting http service..."
sudo apachectl start
echo "Started successfully."
sudo -s
mv /home/ec2-user/.aws ~

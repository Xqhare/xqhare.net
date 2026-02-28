#!/usr/bin/env bash

echo "------------------------------------------------"
echo #
echo "Starting xqhare.net servers script started"
echo #

echo "Starting Main service..."
cd /home/master/docker/xqhare.net/main/
docker compose up -d
cd ..
echo "Main service started."
echo "- - - - - - - - - - - - - - - - - - - - - - - -"
echo #

echo "Starting Blog service..."
cd /home/master/docker/xqhare.net/blog/
docker compose up -d
cd ..
echo "Blog service started."
echo "- - - - - - - - - - - - - - - - - - - - - - - -"
echo #

echo "Starting Profile service..."
cd /home/master/docker/xqhare.net/profile/
docker compose up -d
cd ..
echo "Profile service started."
echo "- - - - - - - - - - - - - - - - - - - - - - - -"
echo #

echo "Starting xqhare.net servers script finished"
echo "------------------------------------------------"
exit 0

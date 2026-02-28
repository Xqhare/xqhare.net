#!/usr/bin/env bash

echo "------------------------------------------------"
echo #
echo "Starting & rebuilding xqhare.net servers script started"
echo #

# Doesn't rebuild the website content at all atm - only docker containers

echo "Starting & rebuilding Main service..."
cd /home/master/docker/xqhare.net/main/
docker compose pull
docker compose up -d && docker image prune -f
cd ..
echo "Main service started & rebuilt."
echo "- - - - - - - - - - - - - - - - - - - - - - - -"
echo #

echo "Starting & rebuilding Blog service..."
cd /home/master/docker/xqhare.net/blog/
docker compose pull
docker compose up -d && docker image prune -f
cd ..
echo "Blog service started & rebuilt."
echo "- - - - - - - - - - - - - - - - - - - - - - - -"
echo #

echo "Starting & rebuilding Profile service..."
cd /home/master/docker/xqhare.net/profile/
docker compose pull
docker compose up -d && docker image prune -f
cd ..
echo "Profile service started & rebuilt."
echo "- - - - - - - - - - - - - - - - - - - - - - - -"
echo #

echo "Starting & rebuilding xqhare.net servers script finished"
echo "------------------------------------------------"
exit 0

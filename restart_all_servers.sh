#!/usr/bin/env bash

echo "------------------------------------------------"
echo #
echo "Restarting xqhare.net servers script started"
echo #

echo "Restarting Main service..."
cd /home/master/docker/xqhare.net/main/
docker compose restart
cd ..
echo "Main service restarted."
echo "- - - - - - - - - - - - - - - - - - - - - - - -"
echo #

echo "Restarting Blog service..."
cd /home/master/docker/xqhare.net/blog/
docker compose restart
cd ..
echo "Blog service restarted."
echo "- - - - - - - - - - - - - - - - - - - - - - - -"
echo #

echo "Restarting Profile service..."
cd /home/master/docker/xqhare.net/profile/
docker compose restart
cd ..
echo "Profile service restarted."
echo "- - - - - - - - - - - - - - - - - - - - - - - -"
echo #

echo "------------------------------------------------"
echo #
echo "Restarting xqhare.net servers script finished"
echo #

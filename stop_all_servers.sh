#!/usr/bin/env bash

echo "------------------------------------------------"
echo #
echo "Stopping xqhare.net servers script started"
echo #

echo "Stopping Main service..."
cd /home/master/docker/xqhare.net/main/
docker compose down
cd ..
echo "Main service stopped."
echo "- - - - - - - - - - - - - - - - - - - - - - - -"
echo #

echo "Stopping Blog service..."
cd /home/master/docker/xqhare.net/blog/
docker compose down
cd ..
echo "Blog service stopped."
echo "- - - - - - - - - - - - - - - - - - - - - - - -"
echo #

echo "Stopping Profile service..."
cd /home/master/docker/xqhare.net/profile/
docker compose down
cd ..
echo "Profile service stopped."
echo "- - - - - - - - - - - - - - - - - - - - - - - -"
echo #

echo "Stopping xqhare.net servers script finished"
echo "------------------------------------------------"
exit 0

#!/usr/bin/env bash
echo Starting \& rebuilding xqhare.net

echo #

# Doesn't rebuild the website content at all atm - only docker containers

echo # Main
echo Start \& rebuild Main service
cd /home/master/docker/xqhare.net/main/
docker compose pull
docker compose up -d && docker image prune -f
cd ..
echo Main service up \& rebuild.

echo # Blog
echo Start \& rebuild Blog service
cd /home/master/docker/xqhare.net/blog/
docker compose pull
docker compose up -d && docker image prune -f
cd ..
echo Blog service up \& rebuild.

echo # Profile
echo Start \& rebuild Profile service
cd /home/master/docker/xqhare.net/profile/
docker compose pull
docker compose up -d && docker image prune -f
cd ..
echo Profile service up \& rebuild.


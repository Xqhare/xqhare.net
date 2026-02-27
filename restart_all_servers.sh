#!/usr/bin/env bash
echo Restarting xqhare.net

echo #

echo # Main
echo Restarting Main service
cd /home/master/docker/xqhare.net/main/
docker compose restart
cd ..
echo Main service restarted.

echo # Blog
echo Restarting Blog service
cd /home/master/docker/xqhare.net/blog/
docker compose restart
cd ..
echo Blog service restarted.

echo # Profile
echo Restarting Profile service
cd /home/master/docker/xqhare.net/profile/
docker compose restart
cd ..
echo Profile service restarted.

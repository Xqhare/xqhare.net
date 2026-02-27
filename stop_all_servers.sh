#!/usr/bin/env bash
echo Stoping xqhare.net

echo #

echo # Main
echo Stoping Main service
cd /home/master/docker/xqhare.net/main/
docker compose down
cd ..
echo Main service up.

echo # Blog
echo Stoping Blog service
cd /home/master/docker/xqhare.net/blog/
docker compose down
cd ..
echo Blog service up.

echo # Profile
echo Stoping Profile service
cd /home/master/docker/xqhare.net/profile/
docker compose down
cd ..
echo Profile service up.


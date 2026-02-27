#!/usr/bin/env bash
echo Starting xqhare.net

echo #

echo # Main
echo Starting Main service
cd /home/master/docker/xqhare.net/main/
docker compose up -d
cd ..
echo Main service up.

echo # Blog
echo Starting Blog service
cd /home/master/docker/xqhare.net/blog/
docker compose up -d
cd ..
echo Blog service up.

echo # Profile
echo Starting Profile service
cd /home/master/docker/xqhare.net/profile/
docker compose up -d
cd ..
echo Profile service up.

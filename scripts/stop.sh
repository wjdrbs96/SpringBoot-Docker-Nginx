#!/usr/bin/env bash

ABSPATH=$(readlink -f $0)
ABSDIR=$(dirname $ABSPATH)
source ${ABSDIR}/profile.sh


IDLE_PORT=$(find_idle_port)
IDLE_PROFILE=$(find_idle_profile)

#echo "> $IDLE_PORT 에서 구동중인 애플리케이션 pid 확인"
#IDLE_PID=$(sudo lsof -ti tcp:${IDLE_PORT})

if [ -z ${IDLE_PID} ]
then
  echo "> 현재 구동중인 애플리케이션이 없으므로 종료하지 않습니다."
else
  echo "> kill -15 $IDLE_PID"
  sudo docker stop IDLE_PROFILE
  sudo docker rm IDLE_RPOFILE
#  kill -15 ${IDLE_PID}
  sleep 5
fi

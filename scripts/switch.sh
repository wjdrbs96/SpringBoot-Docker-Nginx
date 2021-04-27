#!/usr/bin/env bash

ABSPATH=$(readlink -f $0)
ABSDIR=$(dirname $ABSPATH)
source ${ABSDIR}/profile.sh
REPOSITORY=/home/ec2-user/app/step4

function switch_proxy() {
    IDLE_PORT=$(find_idle_port)

    echo "> 전환할 Port: $IDLE_PORT"
    echo "> Port 전환"
    echo "set \$service_url http://3.36.209.141:${IDLE_PORT};" | sudo tee /etc/nginx/conf.d/service-url.inc

    cd REPOSITORY
    echo "> 엔진엑스 Reload"
    sudo docker exec -it nginx nginx -s reload
    echo "> docker exec -it nginx nginx -s reload"
    #sudo service nginx reload
}

#!/bin/bash
host=$(cat /home/alex/docker_project/ansible/ip-web.txt | tr -d '\r')
key=/home/alex/.ssh/id_ed25519
rsync --rsync-path="sudo rsync" -a -e "ssh -i $key" /git/shvirtd-example-python alex@$host:/opt

ssh -i "$key" alex@$host "docker compose -f /opt/shvirtd-example-python/compose.yaml up -d"

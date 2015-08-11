#!/bin/bash

# This scripts reads the USERNAME and PASSWORD of the roblox user from the environments.
# Call this from the lua script please.

USER=$RBXUSER;
PASS=$RBXUSERPASS;

data="{\"username\":\"$USER\",\"password\":\"$PASS\"}";
# log in

curl -s -c ~/.curlcookies -H "Content-Type: application/json" --data-binary $data https://m.roblox.com/Login >> /dev/null

# push the model

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
gzip < $1 > $DIR/outfile.gz
#set -x
CURLBASESTR="curl -v -A Roblox/Darwin -H \"Requester: Client\" -b ~/.curlcookies -c ~/.curlcookies -H \"Content-Type: application/xml; charset=utf-8\" -H \"Content-Encoding: gzip\" --data-binary @$DIR/outfile.gz -X POST "

CURL_TSTR=$CURLBASESTR$2

ASSETID=$(eval $CURL_TSTR)
echo $ASSETID >> assetid.last

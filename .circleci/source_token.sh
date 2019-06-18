#!/bin/bash

FILE=~/auth/token
if test -f "$FILE"; then
    export JOB_PIM_ACCESS_TOKEN=$(cat token | jq '.access_token')
    echo "JOB_PIM_ACCESS_TOKEN: $JOB_PIM_ACCESS_TOKEN"
fi
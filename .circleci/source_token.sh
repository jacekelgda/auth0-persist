#!/bin/bash

FILE=~/auth/token
if test -f "$FILE"; then
    export JOB_PIM_ACCESS_TOKEN=$(cat ~/auth/token | jq '.access_token')
fi
#!/bin/bash

API_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" $JOB_PIM_API_ROUTE --header "authorization: $JOB_PIM_ACCESS_TOKEN")
NOT_AUTHORIZED="401"

if [ "$API_RESPONSE" = "$NOT_AUTHORIZED" ]; then
    NEW_TOKEN=$(curl --request POST \
    --url $JOB_AUTH_DOMAIN \
    --header 'content-type: application/json' \
    --data "{\"client_id\":\"$JOB_AUTH_CLIENT_ID\",\"client_secret\":\"$JOB_AUTH_SECRET\",\"audience\":\"$JOB_AUTH_AUDIENCE\",\"grant_type\":\"client_credentials\"}")

    echo "$NEW_TOKEN" > ~/auth/token
else
  echo "Token is valid"
fi

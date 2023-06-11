#!/bin/bash

URL1="http://localhost:2379"
URL2="http://localhost:22379"
URL3="http://localhost:32379"
Put="/v3/kv/put"
Range="/v3/kv/range"
data_Key=$(echo -n 'fo1o' | base64)
data_Value=$(echo -n 'barbeer' | base64)
PostParam_put='{"key": "'$data_Key'", "value": "'$data_Value'"}'
PostParam_range1='{"key": "'$data_Key'"}'
PostParam_range2='{"key": "Zm9v", "range_end": "Zm9w"}'
URL=$(echo -e "$URL1\n$URL2\n$URL3" | shuf -n 1)
res_put=$(curl -X POST -d "$PostParam_put" "$URL$Put")
URL=$(echo -e "$URL1\n$URL2\n$URL3" | shuf -n 1)
res_range1=$(curl -X POST -d "$PostParam_range1" "$URL$Range")
URL=$(echo -e "$URL1\n$URL2\n$URL3" | shuf -n 1)
res_range2=$(curl -X POST -d "$PostParam_range2" "$URL$Range")

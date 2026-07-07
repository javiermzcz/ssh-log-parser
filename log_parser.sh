#!/bin/bash

LOG_FILE="practice_auth.log"
THRESHOLD=10

grep "Failed password" "$LOG_FILE" |
awk '{print $(NF-3)}' |
sort |
uniq -c |
while read -r count ip; do
    if [ "$count" -ge "$THRESHOLD" ]; then
        echo "⚠ WARNING: $ip ($count failed attempts)"
    else
        echo "$ip: $count attempts - OK"
    fi
done


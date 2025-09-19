#!/bin/bash
# random-exit.sh: Exits with 0 or 1 randomly
result=$((RANDOM % 2))
echo "Random exit code: $result"
exit $result

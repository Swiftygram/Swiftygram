#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" || {
    echo "Error getting script directory" >&2
    exit 1
}

grep -E -r -o "\WL\.([A-Za-z\.0-9_]+)" ../Source/AuthUI/* >> used_keywords.txt

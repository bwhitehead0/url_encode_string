#!/bin/bash
url_encode_string() {
    local input="$1"
    local output=""
    local i

    for (( i=0; i<${#input}; i++ )); do
        char="${input:i:1}"
        case "$char" in
            [a-zA-Z0-9.~_-]) 
                output+="$char"
                ;;
            *)
                output+=$(printf '%%%02X' "'$char")
                ;;
        esac
    done
    echo "$output"
}

usage() {
    echo "Usage: $0 <string>"
    exit "$1"
}

# if no arguments or too many arguments are provided, show usage, for possible standalone use. passing '1' to usage as if the script grows we may accept parameters and will be ready to accept '0' as a valid exit code.
[ "$#" -ne 1 ] && usage "1"

url_encode_string "$1"
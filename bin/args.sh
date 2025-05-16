#!/bin/bash
# Example script, expects arguments like "key=val"
# expects at least one "url=value"

#argument hash (dictionary)
declare -A args

# build hash from arguments
for arg in "$@"; do
    IFS='='
    read key val <<< $arg
    args[$key]=$val
done

# how to retrieve a named value
if [ -z ${args["url"]} ]; then 
    echo "Argument 'url=some_site' is needed!"
    exit
fi

echo "url ${args['url']}"


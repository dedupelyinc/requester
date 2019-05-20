#!/bin/bash

method="$1"
path="$2"
conf="$3"
key="$4"
apiKey=$(ruby -ryaml -e "puts YAML.load_file('$conf')['$key']")

curl -X $method "$path?apiKey=$apiKey" -vvv
#!/bin/bash

method="$1"
path="$2"
conf="$3"
key="$4"
croncheckurl="$5"
apiKey=$(ruby -ryaml -e "puts YAML.load_file('$conf')['$key']")

curl -m 10 "$croncheckurl/start"
curl -X $method "$path?apiKey=$apiKey" -vvv
curl -m 10 "$croncheckurl/end"
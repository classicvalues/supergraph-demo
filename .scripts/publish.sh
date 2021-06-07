#!/bin/bash 
 
source "$(dirname $0)/subgraphs.sh"
source "$(dirname $0)/get-env.sh"

graph=$1
if [[ -z "${graph}" ]]; then
  source "$(dirname $0)/get-graph-id.sh"
fi

echo "subgraphs:"
for subgraph in ${subgraphs[@]}; do
  url="url_$subgraph"
  echo "rover subgraph publish ${graph} --routing-url ${!url} --schema subgraphs/${subgraph}.graphql --name ${subgraph}"
  rover subgraph publish ${graph} --routing-url ${!url} --schema subgraphs/${subgraph}.graphql --name ${subgraph}
done

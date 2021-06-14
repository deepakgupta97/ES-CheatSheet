#!/bin/bash
# file:reindex.sh
indexName="The name of the index"
newClusterUser="The username of the destination Elasticsearch cluster"
newClusterPass="The password of the destination Elasticsearch cluster"
newClusterHost="The host of the destination Elasticsearch cluster"
oldClusterUser="The username of the source Elasticsearch cluster"
oldClusterPass="The password of the source Elasticsearch cluster"
# You must specify the host of the source Elasticsearch cluster in the format of [scheme]://[host]:[port]. Example: http://10.37.1.*:9200.
oldClusterHost="The host of the source Elasticsearch cluster"
curl -u ${newClusterUser}:${newClusterPass} -XPOST "http://${newClusterHost}/_reindex?pretty" -H "Content-Type: application/json" -d'{
    "source": {
        "remote": {
            "host": "'${oldClusterHost}'",
            "username": "'${oldClusterUser}'",
            "password": "'${oldClusterPass}'"
        },
        "index": "'${indexName}'",
        "query": {
            "match_all": {}
        }
    },
    "dest": {
       "index": "'${indexName}'"
    }
}'




#!/bin/bash

DEMOS_COUCHDB=${DEMOS_COUCHDB:-http://localhost:5984}
DEMOS_DB_DIR=${DEMOS_DB_DIR:-/var/lib/couchdb}
echo $DEMOS_COUCHDB

exitError () {
    echo "Exiting: $1" 1>&2
    exit 1
}

test -n "$TEST_ENV" && \
exitError "unset TEST_ENV so sentinel runs correctly."

curl --fail -s "${DEMOS_COUCHDB}/_session" > /dev/null || \
    exitError "Failed to connect to CouchDB."

test -d "${DEMOS_DB_DIR}" || \
    exitError "CouchDB database directory not found."


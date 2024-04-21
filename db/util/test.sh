#!/bin/bash

function setup() {
   ./scripts/startdb.sh > /dev/null
   psql template1 < ./src/create_tables.sql
   psql template1 < ./src/create_functions.sql
}

function teardown() {
   ./scripts/rmdb.sh > /dev/null
}

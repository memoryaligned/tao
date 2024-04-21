#!/bin/bash

function setup() {
   ./scripts/startdb.sh > /dev/null
   psql template1 < ./src/install.sql
}

function teardown() {
   ./scripts/rmdb.sh > /dev/null
}

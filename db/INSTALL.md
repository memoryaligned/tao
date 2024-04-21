# Installation of Database Functionality

## Installation

NOTE: replace "template1" (a default database) with your database name

```
psql template1  < src/install.sql
```

## To set up a temporary database

The following script will create a temporary database and start the database
based on the configuration provided in the local etc/test.cfg file.

```
./scripts/startdb.sh
```

#!/usr/bin/env bash

# psql -d nba_db -f players.sql
psql -d nba_db -f players.sql -h localhost -U postgres -p 5433

#!/bin/bash

while true 
do
   # put here the files you want to watch for changes
   inotifywait -e close_write paper.txt ./data/ ./images/ ./plots/
   # execute next commands
   make
done

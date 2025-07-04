#!/bin/bash

echo "Starting Java Build Process"

mkdir -p out

javac -d out JavaGitBuildJob/src/*.java

if [ $? -eq 0 ]; then
    echo "Java compilation successful"
else
    echo "Compilation Failed"
    exit 1
fi

#!/bin/bash/

echo "Running test cases..."

python3 app.py > output.txt

if grep -q "Success" output.txt; then
    echo "Test Passed!"
    exit 0
else
    echo "Test Failed!"
    exit 1
fi
#! /bin/bash

# Script will reproduce the autograder file structure in local development
# and prepare a autograder.zip ready for upload

# Go to the directory of this script (in case it's executed from else where)
SCRIPT="local_run.sh"
cd "$(dirname "$(find $HOME -type f -name $SCRIPT | head -1)")"

# Start from scratch
rm -r $PWD/source $PWD/results $PWD/submission

# Recreate autograde directories
mkdir -p $PWD/source $PWD/results $PWD/submission

# Create dummy submission file
 echo "<h1>Test File</h1>" | tee $PWD/submission/index.html

 # Copy Node files to /source
 cp -r -t $PWD/source tests package.json package-lock.json

./run_autograder &&

# if the previous command finishes quietly and zip (update) all necessary files
zip -rq autograder.zip tests run_autograder setup.sh package*.json
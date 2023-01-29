#!/bin/bash

# check if an argument was passed
if [ $# -eq 0 ]; then
  echo "Please provide an upper bound as an argument"
  exit 1
fi

upper_bound=$1
root=$(pwd)
for i in $(seq 10 $upper_bound); do 
    project_name="yolov$i"
    if [[ ! -d cookiecutter-output/$project_name ]]; then
        python main.py $project_name "$i"
        cd $root/cookiecutter-output/$project_name
        sleep 0.5
        # create git directory
        git init -b main;git add .;git commit -am "moon";
        gh repo create $project_name --public --source=. --remote=upstream
        git push --set-upstream upstream main; git push;
        # publish
        make publish
    fi;
    cd $root
done
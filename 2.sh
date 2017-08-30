#!/bin/sh
read -p "please input changes: " name
 git add $name
 git commit -m "$name"
 git push
##finish

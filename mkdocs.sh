#!/bin/bash

luadoc -d ./documentation ./game 
cd documentation
git add . --all
git commit -m 'update'
git push

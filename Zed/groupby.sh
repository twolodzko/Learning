#!/bin/bash

curl https://gist.githubusercontent.com/fyyying/4aa5b471860321d7b47fd881898162b7/raw/6907bb3a38bfbb6fccf3a8b1edfb90e39714d14f/titanic_dataset.csv \
    | zq 'avg(Survived) by Pclass,Sex | sort -r avg' -

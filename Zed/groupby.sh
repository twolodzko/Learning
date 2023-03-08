#!/bin/bash

cat ../data/titanic_dataset.csv | zq 'avg(Survived) by Pclass,Sex | sort -r avg' -

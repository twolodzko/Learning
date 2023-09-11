#!/bin/bash

echo {1..100} | zq '
switch (
  case (this % 15) == 0 => {val:this, msg:"fizzbuzz"}
  case (this % 3 ) == 0 => {val:this, msg:"fizz"}
  case (this % 5 ) == 0 => {val:this, msg:"buzz"}
  default               => {val:this, msg:this}
) |
merge val |
yield msg
' -

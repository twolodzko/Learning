#!/bin/bash

echo {1..100} | zq '
switch (
  case (this % 15) == 0 => [this, "fizzbuzz"]
  case (this % 3) == 0  => [this, "fizz"]
  case (this % 5) == 0  => [this, "buzz"]
  default               => [this, this]
) |
sort this[0] |
this[1]
' -

#!/bin/bash
actual=$(bash app/greet.sh Jenkins)
expected="Hello, Jenkins!"

if [ "$actual" = "$expected" ]; then
  echo "PASS: greeting is correct"
else
  echo "FAIL: expected '$expected' but got '$actual'"
  exit 1
fi
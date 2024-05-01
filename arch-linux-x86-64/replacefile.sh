#!/usr/bin/bash
mv $1 $1.bak &&
xsel -b > $1

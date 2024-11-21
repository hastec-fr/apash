#!/usr/bin/env bash

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  [ "$APASH_SHELL" = "zsh" ] && . apash source
  apash.import "fr.hastec.apash.util.Log.ex"
else
  . $APASH_HOME_DIR/bin/apash-$APASH_SHELL-min.sh
fi

myCaller(){ Log.ex 1 "myCaller-001" "InvalidNumber" ; }
myGrandCaller(){ myCaller; }

myGrandCaller

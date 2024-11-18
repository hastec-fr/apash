#!/usr/bin/env bash

handler(){
        echo "From lineno: $1 exiting with code $2 (last command was: $3)"
}

Log.out(){
  echo "out: $1"
}

foo(){
# trap 'handler $LINENO "$?" "$BASH_COMMAND"' RETURN
        echo "Hey I'm inside foo and will return 123"
        Log.out $LINENO; return 123
}

foo

echo "never going to happen"
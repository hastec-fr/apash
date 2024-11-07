Describe 'Log.error'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.util.Log.error"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'passes when inputs are consistents and level autorized'
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_ERROR
    When call Log.error 1 "Hello World" "apash"
    The output should equal ""
    The stderr should include "[ERROR] apash (1): Hello World"
    The status should be success
  End

  It 'passes when inputs are consistents and level not autorized'
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF
    When call Log.error 2 "Hello World"
    The output should equal ""
    The stderr should equal ""
    The status should be success
  End
  
  It 'passes when inputs are consistents and level autorized and redirected to standard output'
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_ERROR
    When call Log.error 3 "Hello World" "apash" $APASH_LOG_CHANNEL_STDOUT
    The output should include "[ERROR] apash (3): Hello World"
    The stderr should equal ""
    The status should be success
  End

  It 'passes when inputs are consistents and called from a function'
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_ERROR
    myCaller(){ Log.error 1 "Hello World" ; }
    When call myCaller
    The output should equal ""
    The stderr should include "[ERROR] myCaller (1): Hello World"
    The status should be success
  End

End

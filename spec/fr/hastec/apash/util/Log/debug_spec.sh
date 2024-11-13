Describe 'Log.debug'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.util.Log.debug"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF    

  It 'passes when inputs are consistents and level autorized'
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_DEBUG
    When call Log.debug 1 "Hello World" "apash"
    The output should equal ""
    The stderr should include "[DEBUG] apash (1): Hello World"
    The status should be success
  End

  It 'passes when inputs are consistents and level not autorized'
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_ERROR
    When call Log.debug 2 "Hello World"
    The output should equal ""
    The stderr should equal ""
    The status should be success
  End
  
  It 'passes when inputs are consistents and level autorized and redirected to standard output'
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_DEBUG
    When call Log.debug 3 "Hello World" "apash" $APASH_LOG_CHANNEL_STDOUT
    The output should include "[DEBUG] apash (3): Hello World"
    The stderr should equal ""
    The status should be success
  End

  It 'passes when inputs are consistents and called from a function'
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_DEBUG
    myCaller(){ Log.debug 1 "Hello World" ; }
    When call myCaller
    The output should equal ""
    The stderr should include "[DEBUG] myCaller (1): Hello World"
    The status should be success
  End

End

Describe 'Log.message'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.util.Log.message"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi    

  It 'passes when inputs are consistents and level autorized'
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_INFO
    When call Log.message $APASH_LOG_LEVEL_INFO apash 1 "Hello World"
    The output should equal ""
    The stderr should include "[INFO] apash (1): Hello World"
    The status should be success
  End

  It 'passes when inputs are consistents and level not autorized'
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_INFO
    When call Log.message $APASH_LOG_LEVEL_DEBUG apash 2 "Hello World"
    The output should equal ""
    The stderr should equal ""
    The status should be success
  End
  
  It 'passes when inputs are consistents and level autorized and redirected to standard output'
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_INFO
    When call Log.message $APASH_LOG_LEVEL_INFO apash 3 "Hello World" $APASH_LOG_CHANNEL_STDOUT
    The output should include "[INFO] apash (3): Hello World"
    The stderr should equal ""
    The status should be success
  End
End

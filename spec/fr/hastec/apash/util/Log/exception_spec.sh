Describe 'Log.exception'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.util.Log.exception"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'passes when inputs are consistents and level autorized'
    APASH_LOG_LEVEL=$APASH_LOG_LEVEL_ERROR
    APASH_LOG_STACK_TRACE="true"
    myCaller(){ Log.exception 1 "myCaller-001" "InvalidNumber" ; }
    myGrandCaller(){ myCaller; }
    When call myGrandCaller "Hello World"
    The output should equal ""
    The stderr should include "[ERROR] myCaller (1): Exception InvalidNumber at myCaller-001"
    The stderr should include " at myCaller(main"
    The stderr should include " at myGrandCaller(main"
    The status should be success
  End

  It 'passes when inputs are consistents and level not autorized'
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF
    myCaller(){ Log.exception 1 "myCaller-001" "InvalidNumber" ; }
    myGrandCaller(){ myCaller; }
    When call myCaller "Hello World"
    The output should equal ""
    The stderr should include ""
    The status should be success
  End

End

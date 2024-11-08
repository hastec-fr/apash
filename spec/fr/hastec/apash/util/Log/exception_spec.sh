Describe 'Log.exception'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.util.Log.exception"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'passes when inputs are consistents and level autorized'
    Skip if "is zsh" global_helper_is_zsh
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_ERROR
    export APASH_LOG_STACK_TRACE="true"
    local apashScript="$APASH_HOME_DIR/spec/fr/hastec/apash/util/Log/exception_spec_script.sh"
    When run $APASH_SHELL "$apashScript"
    The output should equal ""
    The stderr should include "[ERROR] myCaller (1): Exception InvalidNumber at myCaller-001"
    The stderr should include " at myCaller($apashScript"
    The stderr should include " at myGrandCaller($apashScript"
    The status should be success
  End

  # @todo: Create same mecanism than script import to determine which spec should be ran
  It 'passes when inputs are consistents and level autorized'
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_ERROR
    export APASH_LOG_STACK_TRACE="true"
    local apashScript="$APASH_HOME_DIR/spec/fr/hastec/apash/util/Log/exception_spec_script.sh"
    When run $APASH_SHELL "$apashScript"
    The output should equal ""
    The stderr should include "[ERROR] myCaller (1): Exception InvalidNumber at myCaller-001"
    The stderr should include " at myCaller($apashScript"
    The status should be success
  End

  It 'passes when inputs are consistents and level not autorized'
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF
    export APASH_LOG_STACK_TRACE="true"
    local apashScript="$APASH_HOME_DIR/spec/fr/hastec/apash/util/Log/exception_spec_script.sh"
    When run $APASH_SHELL "$apashScript"
    The output should equal ""
    The stderr should include ""
    The status should be success
  End

End

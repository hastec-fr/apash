Describe 'BashUtils.getFunctionName'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.BashUtils.getFunctionName"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF

  It 'fails when the input depth is invalid'
    When call BashUtils.getFunctionName -1
    The output should equal ""
    The status should be failure
  End

  It 'passes when the input depth is valid'
    When call BashUtils.getFunctionName $((APASH_ARRAY_FIRST_INDEX+0))
    The output should equal "BashUtils.getFunctionName"
    The status should be success
  End
  
  It 'passes when the input depth is not defined'
    myCaller(){ BashUtils.getFunctionName ; }
    When call myCaller
    The output should equal "myCaller"
    The status should be success
  End

  It 'passes when the input depth is defined'
    myCaller(){ BashUtils.getFunctionName $((APASH_ARRAY_FIRST_INDEX+1)) ; }
    When call myCaller
    The output should equal "myCaller"
    The status should be success
  End
End

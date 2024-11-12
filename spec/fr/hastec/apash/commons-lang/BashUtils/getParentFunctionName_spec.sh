Describe 'BashUtils.getParentFunctionName'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.BashUtils.getParentFunctionName"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi    

  # Can't evaluate due to shellspec functions
  # It 'fails when no current function exists'
  #   When call BashUtils.getParentFunctionName
  #   The output should equal ""
  #   The status should be failure
  # End

  # It 'fails when parent function exists'
  #   myCaller(){ BashUtils.getParentFunctionName ; }
  #   When call myCaller
  #   The output should equal "myCaller"
  #   The status should be failure
  # End

  It 'passes when the input depth is defined'
    myCaller(){ BashUtils.getParentFunctionName ; }
    myGrandCaller() { myCaller ;}
    When call myGrandCaller
    The output should equal "myGrandCaller"
    The status should be success
  End
End

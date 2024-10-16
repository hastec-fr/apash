Describe 'BashUtils.isDeclared'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.BashUtils.isDeclared"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi    

  It 'fails when the input name is not a valid variable name'
    When call BashUtils.isDeclared 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name is not a valid variable name'
    When call BashUtils.isDeclared ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name has not been declared'
    unset myVar
    When call BashUtils.isDeclared "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'passes when the variable has been declared'
    local myVar="test"
    When call BashUtils.isDeclared "myVar"
    The output should equal ""
    The status should be success
  End

  It 'passes when the variable has been declared'
    declare -a myArray=()
    When call BashUtils.isDeclared "myArray"
    The output should equal ""
    The status should be success
  End

  It 'passes when the variable has been declared'
    declare -a myMap=()
    When call BashUtils.isDeclared "myMap"
    The output should equal ""
    The status should be success
  End
  
End

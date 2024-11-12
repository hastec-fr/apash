Describe 'BashUtils.isVariable'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.BashUtils.isVariable"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi    

  It 'fails when the input name is not a valid variable name'
    When call BashUtils.isVariable 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name is not a valid variable name'
    When call BashUtils.isVariable ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name has not been declared'
    unset myVar
    When call BashUtils.isVariable "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'passes when the variable has been declared'
    local myVar="test"
    When call BashUtils.isVariable "myVar"
    The output should equal ""
    The status should be success
  End

  It 'fails when the variable has been declared but as an array'
    declare -a myArray=()
    When call BashUtils.isVariable "myArray"
    The output should equal ""
    The status should be failure
  End

  It 'passes when the variable has been declared but as an associative array'
    declare -a myMap=()
    When call BashUtils.isVariable "myMap"
    The output should equal ""
    The status should be failure
  End
  
End

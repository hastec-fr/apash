Describe 'ArrayUtils.getLength'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash/commons-lang/ArrayUtils/getLength.sh"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input name does not refere to an array'
    When call ArrayUtils.getLength 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.getLength ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.getLength " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local myVar="test"
    When call ArrayUtils.getLength "myVar" "0"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local -A myMap=(["foo"]="bar")
    When call ArrayUtils.getLength "myMap" "0"
    The output should equal ""
    The status should be failure
  End

  It 'passes when input reference is an array'
    local myArray=("a" "b" "" "c")
    When call ArrayUtils.getLength "myArray"
    The output should equal "4"
    The status should be success
  End

  It 'passes when input reference is an array'
    local myArray=()
    When call ArrayUtils.getLength "myArray"
    The output should equal "0"
    The status should be success
  End
  
  It 'passes when input reference is an array'
    local myArray=("a" "b" "" "c")
    myArray[9223372036854775807]=z
    When call ArrayUtils.getLength "myArray"
    The output should equal "5"
    The status should be success
  End
  
End

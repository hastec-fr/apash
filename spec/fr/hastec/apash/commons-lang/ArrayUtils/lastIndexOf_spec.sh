Describe 'ArrayUtils.lastIndexOf'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.lastIndexOf
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.lastIndexOf
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input does not refer to an array'
    When call ArrayUtils.lastIndexOf "" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.lastIndexOf " " "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input does not refer to an array'
    local myVar="test"
    When call ArrayUtils.lastIndexOf "myVar" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.lastIndexOf "myArray" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input does not refer to an array'
    local -A myMap=(["foo"]="a")
    When call ArrayUtils.lastIndexOf "myMap" "a"
    The output should equal ""
    The status should be failure
  End
 
  It 'passes when references are arrays and value is present'
    local myArray=("a" "b" "" "c" "b")
    When call ArrayUtils.lastIndexOf "myArray" "b"
    The output should equal "$((APASH_ARRAY_FIRST_INDEX+4))"
    The status should be success
  End

  It 'passes when references are arrays and value is present'
    local myArray=("a" "b")
    When call ArrayUtils.lastIndexOf "myArray" "a" -1
    The output should equal "$APASH_ARRAY_FIRST_INDEX"
    The status should be success
  End

  It 'passes when references are arrays and value is present'
    local myArray=("a" "" "b")
    When call ArrayUtils.lastIndexOf "myArray" "" 1
    The output should equal "$((APASH_ARRAY_FIRST_INDEX+1))"
    The status should be success
  End

  It 'returns ArrayUtils_INDEX_NOT_FOUND when value is not present'
    local myArray=("a" "b")
    When call ArrayUtils.lastIndexOf "myArray" "c"
    The output should equal "-1"
    The status should be failure
  End

  It 'returns ArrayUtils_INDEX_NOT_FOUND when value is not present'
    local myArray=("a" "b")
    When call ArrayUtils.lastIndexOf "myArray" "a" "3"
    The output should equal "-1"
    The status should be failure
  End

  It 'returns ArrayUtils_INDEX_NOT_FOUND when value is not present'
    local myArray=("a" "b")
    When call ArrayUtils.lastIndexOf "myArray" ""
    The output should equal "-1"
    The status should be failure
  End

End


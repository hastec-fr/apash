Describe 'ArrayUtils.indexOf'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.indexOf
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input name does not refere to an array'
    When call ArrayUtils.indexOf
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.indexOf ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.indexOf " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local myVar="test"
    When call ArrayUtils.indexOf "myVar" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local -A myMap=(["foo"]="bar")
    When call ArrayUtils.indexOf "myMap" "a"
    The output should equal ""
    The status should be failure
  End

  It 'passes when references are arrays and value is present'
    local myArray=("a" "b" "" "c" "b")
    When call ArrayUtils.indexOf "myArray" "a"
    The output should equal "$((APASH_ARRAY_FIRST_INDEX+0))"
    The status should be success
  End

  It 'passes when references are arrays and value is present'
    local myArray=("a" "b" "" "c" "b")
    When call ArrayUtils.indexOf "myArray" "b"
    The output should equal "$((APASH_ARRAY_FIRST_INDEX+1))"
    The status should be success
  End

  It 'passes when references are arrays and value is present'
    local myArray=("a" "b")
    When call ArrayUtils.indexOf "myArray" "a" "-1"
    The output should equal "$((APASH_ARRAY_FIRST_INDEX+0))"
    The status should be success
  End

  It 'passes when references are arrays and value is present'
    myArray=("a" "" "b")
    When call ArrayUtils.indexOf "myArray" "" "-1"
    The output should equal "$((APASH_ARRAY_FIRST_INDEX+1))"
    The status should be success
  End

  It 'returns ArrayUtils_INDEX_NOT_FOUND when value is not present'
    local myArray=("a" "b")
    When call ArrayUtils.indexOf "myArray" "c"
    The output should equal "-1"
    The status should be success
  End
  
  It 'returns ArrayUtils_INDEX_NOT_FOUND when value is not present'
    local myArray=("a" "b")
    When call ArrayUtils.indexOf "myArray" "a" 3
    The output should equal "-1"
    The status should be success
  End

  It 'returns ArrayUtils_INDEX_NOT_FOUND when value is not present'
    local myArray=("a" "b")
    When call ArrayUtils.indexOf "myArray" ""
    The output should equal "-1"
    The status should be success
  End

End


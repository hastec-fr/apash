Describe 'ArrayUtils.countMatches'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.ArrayUtils.countMatches"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input name does not refere to an array'
    When call ArrayUtils.countMatches 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.countMatches ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.countMatches " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local myVar="test"
    When call ArrayUtils.countMatches "myVar" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local -A myMap=(["foo"]="bar")
    When call ArrayUtils.countMatches "myMap" "a"
    The output should equal ""
    The status should be failure
  End

  It 'passes when reference is an array'
    local myArray=("a" "b" "" "a" "c" "" "")
    When call ArrayUtils.countMatches "myArray"
    The output should equal "3"
    The status should be success
  End

  It 'passes when reference is an array'
    local myArray=("a" "b" "" "a" "c" "" "")
    When call ArrayUtils.countMatches "myArray" "d"
    The output should equal "0"
    The status should be success
  End

  It 'passes when reference is an array'
    local myArray=("a" "b" "" "a" "c" "" "")
    When call ArrayUtils.countMatches "myArray" "b"
    The output should equal "1"
    The status should be success
  End

  It 'passes when reference is an array'
    local myArray=("a" "b" "" "a" "c" "" "")
    When call ArrayUtils.countMatches "myArray" "a"
    The output should equal "2"
    The status should be success
  End
End

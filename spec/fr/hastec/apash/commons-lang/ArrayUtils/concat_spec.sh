Describe 'ArrayUtils.concat'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.ArrayUtils.concat"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input name does not refere to an array'
    When call ArrayUtils.concat 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.concat ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.concat " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local myVar="test"
    When call ArrayUtils.concat "myVar" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local -A myMap=(["foo"]="bar")
    When call ArrayUtils.concat "myMap" "a"
    The output should equal ""
    The status should be failure
  End

  It 'passes when reference is an array'
    local outArray=()
    local myArray1=("a" "b" "" "c")
    local myArray2=("foo bar" "" "bat")
    When call ArrayUtils.concat "outArray" "myArray1" "myArray2"
    The output should equal ""
    The status should be success
    The value "${#outArray[@]}" should eq 7
    The variable 'outArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'outArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'outArray[APASH_ARRAY_FIRST_INDEX+2]' should eq ""
    The variable 'outArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "c"
    The variable 'outArray[APASH_ARRAY_FIRST_INDEX+4]' should eq "foo bar"
    The variable 'outArray[APASH_ARRAY_FIRST_INDEX+5]' should eq ""
    The variable 'outArray[APASH_ARRAY_FIRST_INDEX+6]' should eq "bat"
  End

  It 'passes when references are arrays and result array is the input array'
    local outArray=("a" "b" "" "c")
    local myArray2=("foo bar")
    myArray2[APASH_ARRAY_FIRST_INDEX+3]="bat"
    When call ArrayUtils.concat "outArray" "outArray" "myArray2"
    The output should equal ""
    The status should be success
    The variable 'outArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'outArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'outArray[APASH_ARRAY_FIRST_INDEX+2]' should eq ""
    The variable 'outArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "c"
    The variable 'outArray[APASH_ARRAY_FIRST_INDEX+4]' should eq "foo bar"
    The variable 'outArray[APASH_ARRAY_FIRST_INDEX+7]' should eq "bat"
  End

End

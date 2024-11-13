Describe 'ArrayUtils.toArray'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.toArray
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.toArray
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input does not refer to an array'
    When call ArrayUtils.toArray "" "0" "1"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.toArray " " "0" "1"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name refer to variable which is not an array'
    local myVar="test"
    When call ArrayUtils.toArray "myVar" "0" "1"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name refer to variable which is not an array'
    local -A myMap=(["foo"]="a")
    When call ArrayUtils.toArray "myMap" "0" "1"
    The output should equal ""
    The status should be failure
  End
 
  It 'passes when the reference is an array'
    local myArray=()
    When call ArrayUtils.toArray "myArray" 2
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 1
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "2"
  End

  It 'passes when the reference is an array'
    local myArray=()
    When call ArrayUtils.toArray "myArray" "a" "b" "c" "d"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "d"
  End

  It 'passes when the reference is an array'
    local myArray=()
    When call ArrayUtils.toArray "myArray" "a" "2" "b"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 3
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "2"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "b"
  End

End



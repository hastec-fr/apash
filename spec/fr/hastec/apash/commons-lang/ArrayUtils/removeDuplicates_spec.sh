Describe 'ArrayUtils.removeDuplicates'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.removeDuplicates
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.removeDuplicates
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input does not refer to an array'
    When call ArrayUtils.removeDuplicates ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.removeDuplicates " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.removeDuplicates "myArray"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name refer to variable which is not an array'
    local myVar="aaaa"
    When call ArrayUtils.removeDuplicates "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name refer to variable which is not an array'
    local -A myMap=(["foo"]="a" ["bar"]="a")
    When call ArrayUtils.removeDuplicates "myMap"
    The output should equal ""
    The status should be failure
  End
 
  It 'passes when the reference is an arrays the index is valid'
    local myArray=("a" "b" "a" "c")
    When call ArrayUtils.removeDuplicates "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 3
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
  End

  It 'passes when the reference is an arrays the index is valid'
    local myArray=()
    When call ArrayUtils.removeDuplicates "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 0
  End

  It 'passes when the reference is an arrays the index is valid'
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.removeDuplicates "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "d"
  End

End


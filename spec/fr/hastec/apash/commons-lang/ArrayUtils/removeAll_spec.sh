Describe 'ArrayUtils.removeAll'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.removeAll
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.removeAll
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input does not refer to an array'
    When call ArrayUtils.removeAll "" $((APASH_ARRAY_FIRST_INDEX+0))
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.removeAll " " $((APASH_ARRAY_FIRST_INDEX+0))
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.removeAll "myArray" $((APASH_ARRAY_FIRST_INDEX+0))
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name refer to variable which is not an array'
    local myVar="a"
    When call ArrayUtils.removeAll "myVar" $((APASH_ARRAY_FIRST_INDEX+0))
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name refer to variable which is not an array'
    local -A myMap=(["foo"]="a")
    When call ArrayUtils.removeAll "myMap" $((APASH_ARRAY_FIRST_INDEX+0))
    The output should equal ""
    The status should be failure
  End
 
  It 'passes when the reference is an arrays and the indexes are valid'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.removeAll "myArray" $((APASH_ARRAY_FIRST_INDEX+4))
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq ""
  End

  It 'passes when the reference is an arrays and the indexes are valid'
    local myArray=("a" "b" "c" "")
    When call ArrayUtils.removeAll "myArray" $((APASH_ARRAY_FIRST_INDEX+0)) $((APASH_ARRAY_FIRST_INDEX+2))
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 2
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "b"    
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq ""
  End

  It 'passes when the reference is an arrays and indexes are discontinued'
    local myArray=("a" "b" "foo bar" "" "c")
    myArray[APASH_ARRAY_FIRST_INDEX+10]="z"
    When call ArrayUtils.removeAll "myArray" $((APASH_ARRAY_FIRST_INDEX+0)) $((APASH_ARRAY_FIRST_INDEX+6))
    The output should equal ""
    The status should be success
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "foo bar"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq ""
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+8]' should eq "z"
  End
  
  It 'fails when an index is not present'
    local myArray=("a")
    When call ArrayUtils.removeAll "myArray" $((APASH_ARRAY_FIRST_INDEX+4))
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 1
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
  End

  It 'fails when an index is not present'
    local myArray=("a")
    When call ArrayUtils.removeAll "myArray" -1
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 1
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
  End

  It 'fails when an index is not present'
    local myArray=("a" "b")
    When call ArrayUtils.removeAll "myArray" $((APASH_ARRAY_FIRST_INDEX+0)) -1
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 2
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
  End

  It 'fails when the index is not present'
    local myArray=()
    When call ArrayUtils.removeAll "myArray" $((APASH_ARRAY_FIRST_INDEX+0))
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 0
  End
End


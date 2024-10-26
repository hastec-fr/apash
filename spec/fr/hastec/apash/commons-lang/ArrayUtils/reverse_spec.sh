Describe 'ArrayUtils.reverse'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.reverse
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.reverse
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input does not refer to an array'
    When call ArrayUtils.reverse ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.reverse " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name refer to variable which is not an array'
    local myVar="abcd"
    When call ArrayUtils.reverse "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name refer to variable which is not an array'
    local -A myMap=(["foo"]="a" ["bar"]="a")
    When call ArrayUtils.reverse "myMap"
    The output should equal ""
    The status should be failure
  End
 
  It 'passes when the reference is an array'
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.reverse "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "d"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "a"
  End

  It 'passes when the reference is an array'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.reverse "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "d"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq ""
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+4]' should eq "a"
  End
  
  It 'passes when the reference is an array'
    local myArray=("a")
    When call ArrayUtils.reverse "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 1
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
  End

  It 'passes when the reference is an array'
    local myArray=()
    When call ArrayUtils.reverse "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 0
  End

  It 'passes when the reference is an array and starting index is a number'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.reverse "myArray" $((APASH_ARRAY_FIRST_INDEX+2))
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "d"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq ""
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+4]' should eq "c"
  End

  It 'passes when the reference is an array and starting/ending index are numbers'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.reverse "myArray" $((APASH_ARRAY_FIRST_INDEX+1)) $((APASH_ARRAY_FIRST_INDEX+4))
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq ""
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+4]' should eq "d"
  End

  It 'passes even when indexes are not in the bounds'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.reverse "myArray" -1
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "d"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq ""
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+4]' should eq "a"
  End

  It 'passes even when indexes are not in the bounds'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.reverse "myArray" -1 $((APASH_ARRAY_FIRST_INDEX+10))
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "d"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq ""
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+4]' should eq "a"
  End

  It 'passes even when indexes are not in the bounds'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.reverse "myArray" $((APASH_ARRAY_FIRST_INDEX+0)) $((APASH_ARRAY_FIRST_INDEX+10))
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "d"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq ""
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+4]' should eq "a"
  End

  It 'passes even when indexes are not in the bounds'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.reverse "myArray" 5 4
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq ""
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+4]' should eq "d"
  End

  It 'passes even when indexes are not in the bounds'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.reverse "myArray" 10 15
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq ""
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+4]' should eq "d"
  End

  It 'passes even when indexes are not in the bounds'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.reverse "myArray" $((APASH_ARRAY_FIRST_INDEX+3)) $((APASH_ARRAY_FIRST_INDEX+5))
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "d"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+4]' should eq ""
  End

  It 'fails when the indexes are not numbers'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.reverse "myArray" "a"
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq ""
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+4]' should eq "d"
  End

  It 'fails when the indexes are not numbers'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.reverse "myArray" "1" "b"
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq ""
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+4]' should eq "d"
  End

  It 'fails when the indexes are not numbers'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.reverse "myArray" "c" "d"
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq ""
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+4]' should eq "d"
  End
End


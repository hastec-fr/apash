Describe 'ArrayUtils.swap'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.swap
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.swap
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input does not refer to an array'
    When call ArrayUtils.swap "" "0" "1"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.swap " " "0" "1"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name refer to variable which is not an array'
    local myVar="test"
    When call ArrayUtils.swap "myVar" "0" "1"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name refer to variable which is not an array'
    local -A myMap=(["foo"]="a")
    When call ArrayUtils.swap "myMap" "0" "1"
    The output should equal ""
    The status should be failure
  End
 
  It 'passes when the reference is an array and offset are declared'
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.swap "myArray" $((APASH_ARRAY_FIRST_INDEX+0)) $((APASH_ARRAY_FIRST_INDEX+2))
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "d"
  End

  It 'passes when the reference is an array and offset are declared'
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.swap "myArray" $((APASH_ARRAY_FIRST_INDEX+0)) $((APASH_ARRAY_FIRST_INDEX+2)) 1
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "d"
  End

  It 'passes when the reference is an array and offset are declared'
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.swap "myArray" $((APASH_ARRAY_FIRST_INDEX+0)) $((APASH_ARRAY_FIRST_INDEX+2)) 2
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "d"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "b"
  End

  It 'passes when the reference is an array and offset are declared'
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.swap "myArray" 0 2 0
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "d"
  End

  It 'passes when the reference is an array and offset are declared'
    local myArray=("a" "b" "c" "d" "e")
    When call ArrayUtils.swap "myArray" $((APASH_ARRAY_FIRST_INDEX+0)) $((APASH_ARRAY_FIRST_INDEX+2)) 2
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "d"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+4]' should eq "e"
  End

  It 'passes when the reference is an array and offset are declared'
    local myArray=("a" "b" "c" "d" "e")
    When call ArrayUtils.swap "myArray" $((APASH_ARRAY_FIRST_INDEX+1)) $((APASH_ARRAY_FIRST_INDEX+3)) 3
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "d"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "e"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+4]' should eq "c"
  End

  It 'passes even when indexes are not out of bounds'
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.swap "myArray" $((APASH_ARRAY_FIRST_INDEX+0)) $((APASH_ARRAY_FIRST_INDEX+10))
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "d"
  End

  It 'passes even when indexes are not out of bounds'
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.swap "myArray" -1 $((APASH_ARRAY_FIRST_INDEX+2))
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "d"
  End

  It 'passes even when indexes are not out of bounds'
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.swap "myArray" -1 $((APASH_ARRAY_FIRST_INDEX+10))
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "d"
  End

  It 'passes even when indexes are not out of bounds'
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.swap "myArray" $((APASH_ARRAY_FIRST_INDEX+0)) $((APASH_ARRAY_FIRST_INDEX+2)) 10
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "d"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "b"
  End

  It 'fails when the indexes are not numbers'
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.swap "myArray" "a"
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "d"
  End

  It 'fails when the indexes are not numbers'
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.swap "myArray" "1" "b"
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "d"
  End

  It 'fails when the indexes are not numbers'
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.swap "myArray" "c" "d"
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "d"
  End

  It 'fails when the indexes are not numbers'
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.swap "myArray" $((APASH_ARRAY_FIRST_INDEX+1)) $((APASH_ARRAY_FIRST_INDEX+2)) "a"
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "d"
  End
End



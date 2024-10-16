Describe 'ArrayUtils.shift'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.shift
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.shift
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input does not refer to an array'
    When call ArrayUtils.shift ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.shift " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name refer to variable which is not an array'
    local myVar="test"
    When call ArrayUtils.shift "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name refer to variable which is not an array'
    local -A myMap=(["foo"]="a")
    When call ArrayUtils.shift "myMap"
    The output should equal ""
    The status should be failure
  End
 
  It 'returns the same array when the shift is not set'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.shift "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "b"
    The variable 'myArray[2]' should eq "c"
    The variable 'myArray[3]' should eq ""
    The variable 'myArray[4]' should eq "d"
  End

  It 'returns the same array when the shift is set to 0'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.shift "myArray" 0
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "b"
    The variable 'myArray[2]' should eq "c"
    The variable 'myArray[3]' should eq ""
    The variable 'myArray[4]' should eq "d"
  End

  It 'returns the same array when the shift is set to the length of the array'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.shift "myArray" "${#myArray[@]}"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "b"
    The variable 'myArray[2]' should eq "c"
    The variable 'myArray[3]' should eq ""
    The variable 'myArray[4]' should eq "d"
  End
  
  It 'returns the array with shifted elements'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.shift "myArray" 1 3
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "b"
    The variable 'myArray[2]' should eq "c"
    The variable 'myArray[3]' should eq "d"
    The variable 'myArray[4]' should eq ""
  End

  It 'returns the array with shifted elements'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.shift "myArray" 2
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[0]' should eq ""
    The variable 'myArray[1]' should eq "d"
    The variable 'myArray[2]' should eq "a"
    The variable 'myArray[3]' should eq "b"
    The variable 'myArray[4]' should eq "c"
  End
  
  It 'returns the array with shifted elements'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.shift "myArray" 1 1 3
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "c"
    The variable 'myArray[2]' should eq "b"
    The variable 'myArray[3]' should eq ""
    The variable 'myArray[4]' should eq "d"
  End

  It 'returns the array with shifted elements even if indexes are out of bounds'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.shift "myArray" -1 10
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "b"
    The variable 'myArray[2]' should eq "c"
    The variable 'myArray[3]' should eq ""
    The variable 'myArray[4]' should eq "d"
  End

  It 'returns the array with shifted elements even if indexes are out of bounds'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.shift "myArray" 0 10
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "b"
    The variable 'myArray[2]' should eq "c"
    The variable 'myArray[3]' should eq ""
    The variable 'myArray[4]' should eq "d"
  End

  It 'returns the array with shifted elements even if indexes are out of bounds'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.shift "myArray" 5 4
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "b"
    The variable 'myArray[2]' should eq "c"
    The variable 'myArray[3]' should eq ""
    The variable 'myArray[4]' should eq "d"
  End

  It 'returns the array with shifted elements even if indexes are out of bounds'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.shift "myArray" 10 15
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "b"
    The variable 'myArray[2]' should eq "c"
    The variable 'myArray[3]' should eq ""
    The variable 'myArray[4]' should eq "d"
  End

  It 'returns the array with shifted elements even if indexes are out of bounds'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.shift "myArray" 4 4
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "b"
    The variable 'myArray[2]' should eq "c"
    The variable 'myArray[3]' should eq ""
    The variable 'myArray[4]' should eq "d"
  End

  It 'returns the array with shifted elements even if indexes are out of bounds'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.shift "myArray" 3 4
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "b"
    The variable 'myArray[2]' should eq "c"
    The variable 'myArray[3]' should eq ""
    The variable 'myArray[4]' should eq "d"
  End

  It 'returns the array with shifted elements even if indexes are out of bounds'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.shift "myArray" 1 1 10
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "d"
    The variable 'myArray[2]' should eq "b"
    The variable 'myArray[3]' should eq "c"
    The variable 'myArray[4]' should eq ""
  End

  It 'fails when the indexes are not numbers'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.shift "myArray" "a"
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "b"
    The variable 'myArray[2]' should eq "c"
    The variable 'myArray[3]' should eq ""
    The variable 'myArray[4]' should eq "d"
  End

  It 'fails when the indexes are not numbers'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.shift "myArray" "1" "b"
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "b"
    The variable 'myArray[2]' should eq "c"
    The variable 'myArray[3]' should eq ""
    The variable 'myArray[4]' should eq "d"
  End

  It 'fails when the indexes are not numbers'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.shift "myArray" "c" "d"
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "b"
    The variable 'myArray[2]' should eq "c"
    The variable 'myArray[3]' should eq ""
    The variable 'myArray[4]' should eq "d"
  End

  It 'fails when the indexes are not numbers'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.shift "myArray" 1 1 "e"
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "b"
    The variable 'myArray[2]' should eq "c"
    The variable 'myArray[3]' should eq ""
    The variable 'myArray[4]' should eq "d"
  End
End


Describe 'ArrayUtils.subarray'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.subarray
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.subarray
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input does not refer to an array'
    When call ArrayUtils.subarray "" "myArray" "0" "1"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.subarray " " "myArray" "0" "1"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name refer to variable which is not an array'
    local myVar="test"
    When call ArrayUtils.subarray "myVar" "myArray" "0" "1"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name refer to variable which is not an array'
    local -A myMap=(["foo"]="a")
    When call ArrayUtils.subarray "myMap" "myArray" "0" "1"
    The output should equal ""
    The status should be failure
  End
 
  It 'passes when the reference is an array and indices valid positive integers'
    local mySubArray=()
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.subarray "mySubArray" "myArray" 0 2
    The output should equal ""
    The status should be success
    The value "${#mySubArray[@]}" should eq 2
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
  End

  It 'passes when the reference is an array and indices valid positive integers'
    local mySubArray=()
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.subarray "mySubArray" "myArray" 0 0
    The output should equal ""
    The status should be success
    The value "${#mySubArray[@]}" should eq 0
  End

  It 'passes when the reference is an array and indices valid positive integers'
    local mySubArray=()
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.subarray "mySubArray" "myArray" 3 4
    The output should equal ""
    The status should be success
    The value "${#mySubArray[@]}" should eq 1
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "d"
  End

  It 'passes even when indexes are not in the bounds'
    local mySubArray=()
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.subarray "mySubArray" "myArray" 0 10
    The output should equal ""
    The status should be success
    The value "${#mySubArray[@]}" should eq 4
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "d"
  End

  It 'passes even when indexes are not in the bounds'
    local mySubArray=()
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.subarray "mySubArray" "myArray" -1 2
    The output should equal ""
    The status should be success
    The value "${#mySubArray[@]}" should eq 2
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
  End

  It 'passes even when indexes are not in the bounds'
    local mySubArray=()
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.subarray "mySubArray" "myArray" -1 10
    The output should equal ""
    The status should be success
    The value "${#mySubArray[@]}" should eq 4
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "d"
  End

  It 'passes even when indexes are not in the bounds'
    local mySubArray=()
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.subarray "mySubArray" "myArray" 3 2
    The output should equal ""
    The status should be success
    The value "${#mySubArray[@]}" should eq 0
  End

  It 'passes even when indexes are not in the bounds'
    local mySubArray=()
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.subarray "mySubArray" "myArray" -2 -1
    The output should equal ""
    The status should be success
    The value "${#mySubArray[@]}" should eq 0
  End

  It 'passes even when indexes are not in the bounds'
    local mySubArray=()
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.subarray "mySubArray" "myArray" 10 11
    The output should equal ""
    The status should be success
    The value "${#mySubArray[@]}" should eq 0
  End


  It 'fails when the indexes are not numbers'
    local mySubArray=()
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.subarray "mySubArray" "myArray"
    The output should equal ""
    The status should be failure
    The value "${#mySubArray[@]}" should eq 0
  End

  It 'fails when the indexes are not numbers'
    local mySubArray=()
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.subarray "mySubArray" "myArray" "a"
    The output should equal ""
    The status should be failure
    The value "${#mySubArray[@]}" should eq 0
  End

  It 'fails when the indexes are not numbers'
    local mySubArray=()
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.subarray "mySubArray" "myArray" 1 "b"
    The output should equal ""
    The status should be failure
    The value "${#mySubArray[@]}" should eq 0
  End

  It 'fails when the indexes are not numbers'
    local mySubArray=()
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.subarray "mySubArray" "myArray" "c" "d"
    The output should equal ""
    The status should be failure
    The value "${#mySubArray[@]}" should eq 0
  End
End


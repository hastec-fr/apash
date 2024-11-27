Describe 'ArrayUtils.contains'
  apash.import "fr.hastec.apash.commons-lang.ArrayUtils.contains"

  It 'fails when the input name does not refere to an array'
    When call ArrayUtils.contains 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.contains ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.contains " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local myVar="test"
    When call ArrayUtils.contains "myVar" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local -A myMap=(["foo"]="bar")
    When call ArrayUtils.contains "myMap" "a"
    The output should equal ""
    The status should be failure
  End

  It 'passes when reference is an array and value is present in the array'
    local myArray=("a" "b" "" "c")
    When call ArrayUtils.contains "myArray" "b"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq ""
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "c"
  End

  It 'fails when the value is not present into the array'
    local myArray=("a" "b" "" "c")
    When call ArrayUtils.contains "myArray" "d"
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq ""
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "c"
  End

  It 'fails when the value is not present into the array'
    local myArray=("a" "b" "" "c")
    When call ArrayUtils.contains "myArray" "a b"
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq ""
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "c"
  End

  It 'fails when no value or more than 1 value is provided'
    local myArray=("a" "b" "" "c")
    When call ArrayUtils.contains "myArray" "c" "d"
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq ""
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "c"
  End
End

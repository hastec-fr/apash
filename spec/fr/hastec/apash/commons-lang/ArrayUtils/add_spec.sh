Describe 'ArrayUtils.add'
  apash.import "fr.hastec.apash.commons-lang.ArrayUtils.add"

  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.add 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.add ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.add " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local myVar="test"
    When call ArrayUtils.add "myVar" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local -A myMap=(["foo"]="bar")
    When call ArrayUtils.add "myMap" "a"
    The output should equal ""
    The status should be failure
  End

  It 'passes when no value should be added'
    local myArray=()
    When call ArrayUtils.add "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 0
  End

  It 'passes when reference is an array and value is a string'
    When call ArrayUtils.add "myArray" "a"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 1
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
  End

  It 'passes when reference is an array and value is a string'
    local myArray=("a")
    When call ArrayUtils.add "myArray" "foo bar"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 2
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "foo bar"
  End

  It 'passes when reference is an array and value is a string'
    local myArray=("a" "foo bar")
    When call ArrayUtils.add "myArray" ""
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 3
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "foo bar"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq ""
  End

  It 'passes when indexes are discontinued.'
    local myArray=("a" "foo bar")
    myArray[APASH_ARRAY_FIRST_INDEX+3]="x"
    When call ArrayUtils.add "myArray" "z"
    The output should equal ""
    The status should be success
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "foo bar"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "x"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+4]' should eq "z"
  End
End

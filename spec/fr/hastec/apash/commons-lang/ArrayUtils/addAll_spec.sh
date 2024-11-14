Describe 'ArrayUtils.addAll'
  apash.import "fr.hastec.apash.commons-lang.ArrayUtils.addAll"

  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.addAll 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.addAll ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.addAll " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local myVar="test"
    When call ArrayUtils.addAll "myVar" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local -A myMap=(["foo"]="bar")
    When call ArrayUtils.addAll "myMap" "a"
    The output should equal ""
    The status should be failure
  End

  It 'passes when no value is provided'
    local myArray=("a" "b")
    When call ArrayUtils.addAll "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 2
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+0))]' should eq "a"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+1))]' should eq "b"
  End

  It 'passes when reference is an array and at least 1 one value is provided'
    unset myArray
    When call ArrayUtils.addAll "myArray" "a"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 1
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+0))]' should eq "a"
  End

  It 'passes when reference is an array and at least 1 one value is provided'
    local myArray=("a")
    When call ArrayUtils.addAll "myArray" "foo bar"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 2
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+0))]' should eq "a"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+1))]' should eq "foo bar"
  End

  It 'passes when reference is an array and at least 1 one value is provided'
    local myArray=("a" "foo bar")
    When call ArrayUtils.addAll "myArray" ""
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 3
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+0))]' should eq "a"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+1))]' should eq "foo bar"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+2))]' should eq ""
  End

  It 'passes when reference is an array and at least 1 one value is provided'
    local myArray=("a" "b")
    When call ArrayUtils.addAll "myArray" "c" "d"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+0))]' should eq "a"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+1))]' should eq "b"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+2))]' should eq "c"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+3))]' should eq "d"
  End

  It 'passes when reference is an array and at least 1 one value is provided'
    local myArray=("a" "b")
    local otArray=("c" "d")
    When call ArrayUtils.addAll "myArray" ${otArray[@]}
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+0))]' should eq "a"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+1))]' should eq "b"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+2))]' should eq "c"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+3))]' should eq "d"
  End

  It 'passes when indexes are discontinued'
    local myArray=("a" "b")
    myArray[APASH_ARRAY_FIRST_INDEX+3]="x"
    When call ArrayUtils.addAll "myArray" "foo bar" "z"
    The output should equal ""
    The status should be success
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+0))]' should eq "a"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+1))]' should eq "b"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+3))]' should eq "x"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+4))]' should eq "foo bar"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+5))]' should eq "z"
  End

End

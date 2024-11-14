Describe 'Array.bubbleSort'
  apash.import "fr.hastec.apash.util.Array.bubbleSort"

  It 'fails when the input do not refer to an array'
    When call Array.bubbleSort
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input do not refer to an array'
    When call Array.bubbleSort ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input do not refer to an array'
    local myVar="test"
    When call Array.bubbleSort "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input do not refer to an array'
    local -A myMap=(["foo"]="a")
    When call Array.bubbleSort "myMap"
    The output should equal ""
    The status should be failure
  End

  It 'transforms the unset reference to empty array'
    unset myArray
    When call Array.bubbleSort "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 0
  End
  
  It 'passes when the reference is an array'
    local myArray=("a" "c" "b")
    When call Array.bubbleSort "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 3
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
  End

  It 'passes when the reference is an array'
    local myArray=("beta-20" "beta-10" "beta-1")
    When call Array.bubbleSort "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 3
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "beta-1"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "beta-10"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "beta-20"
  End

  It 'passes when the reference is an array'
    local myArray=("1" "")
    When call Array.bubbleSort "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 2
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq ""
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "1"
  End

  It 'passes when the reference is an array'
    local myArray=("foo \"bar" "a" "bat man")
    When call Array.bubbleSort "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 3
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "bat man"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "foo \"bar"
  End
End

Describe 'ArrayUtils.clone'
  apash.import "fr.hastec.apash.commons-lang.ArrayUtils.clone"
  apash.import "fr.hastec.apash.commons-lang.ArrayUtils.getLastIndex"

  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.clone 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.clone ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.clone " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local myVar="test"
    When call ArrayUtils.clone "myVar" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local -A myMap=(["foo"]="bar")
    When call ArrayUtils.clone "myMap" "myClone"
    The output should equal ""
    The status should be failure
  End

  It 'passes when references are arrays'
    local myArray=()
    local myClone=("a")
    When call ArrayUtils.clone "myArray" "myClone"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 0
    The value "${#myClone[@]}" should eq 0
  End

  It 'passes when references are arrays'
    local myArray=("a" "b" "" "c")
    local myClone=("d" "e" "f")
    When call ArrayUtils.clone "myArray" "myClone"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+0))]' should eq "a"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+1))]' should eq "b"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+2))]' should eq ""
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+3))]' should eq "c"
    The value "${#myClone[@]}" should eq 4
    The variable 'myClone[$((APASH_ARRAY_FIRST_INDEX+0))]' should eq "a"
    The variable 'myClone[$((APASH_ARRAY_FIRST_INDEX+1))]' should eq "b"
    The variable 'myClone[$((APASH_ARRAY_FIRST_INDEX+2))]' should eq ""
    The variable 'myClone[$((APASH_ARRAY_FIRST_INDEX+3))]' should eq "c"
  End

  It 'passes when references are arrays'
    local myArray=("a" "b")
    myArray[$((APASH_ARRAY_FIRST_INDEX+10))]="z"
    local myClone=()
    When call ArrayUtils.clone "myArray" "myClone"
    The output should equal ""
    The status should be success
    The value "$(ArrayUtils.getLastIndex myArray)" should eq "$((APASH_ARRAY_FIRST_INDEX+10))"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+0))]'  should eq "a"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+1))]'  should eq "b"
    The value    "${myArray[$((APASH_ARRAY_FIRST_INDEX+2))]}"  should eq ""
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+10))]' should eq "z"
    The value  "$(ArrayUtils.getLastIndex myArray)" should eq "$((APASH_ARRAY_FIRST_INDEX+10))"
    The variable 'myClone[$((APASH_ARRAY_FIRST_INDEX+0))]'  should eq "a"
    The variable 'myClone[$((APASH_ARRAY_FIRST_INDEX+1))]'  should eq "b"
    The value    "${myClone[$((APASH_ARRAY_FIRST_INDEX+2))]}"  should eq ""
    The variable 'myClone[$((APASH_ARRAY_FIRST_INDEX+10))]' should eq "z"
  End

  It 'passes when references are arrays'
    local myArray=("a" "b" "" "foo bar" "c" "")
    local myClone=()
    When call ArrayUtils.clone "myArray" "myClone"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 6
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+0))]' should eq "a"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+1))]' should eq "b"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+2))]' should eq ""
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+3))]' should eq "foo bar"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+4))]' should eq "c"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+5))]' should eq ""
    The value "${#myClone[@]}" should eq 6
    The variable 'myClone[$((APASH_ARRAY_FIRST_INDEX+0))]' should eq "a"
    The variable 'myClone[$((APASH_ARRAY_FIRST_INDEX+1))]' should eq "b"
    The variable 'myClone[$((APASH_ARRAY_FIRST_INDEX+2))]' should eq ""
    The variable 'myClone[$((APASH_ARRAY_FIRST_INDEX+3))]' should eq "foo bar"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+4))]' should eq "c"
    The variable 'myArray[$((APASH_ARRAY_FIRST_INDEX+5))]' should eq ""
  End
End


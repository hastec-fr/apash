Describe 'ArrayUtils.get'
  apash.import "fr.hastec.apash.commons-lang.ArrayUtils.get"

  It 'fails when the input name does not refere to an array'
    When call ArrayUtils.get 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.get ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.get " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local myVar="test"
    When call ArrayUtils.get "myVar" "0"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local -A myMap=(["foo"]="bar")
    When call ArrayUtils.get "myMap" "0"
    The output should equal ""
    The status should be failure
  End

  It 'fails when index is not present into the array'
    local myArray=("a" "b" "" "c")
    When call ArrayUtils.get "myArray" "-1"
    The output should equal ""
    The status should be failure
  End

  It 'fails when index is not present into the array'
    local myArray=("a" "b" "" "c")
    When call ArrayUtils.get "myArray" "5"
    The output should equal ""
    The status should be failure
  End

  It 'passes when reference is an array and index exists'
    local myArray=("a" "b" "" "c")
    When call ArrayUtils.get "myArray" "$((APASH_ARRAY_FIRST_INDEX+0))"
    The output should equal "a"
    The status should be success
  End

  It 'passes when reference is an array and index exists'
    local myArray=("a" "b" "" "c")
    When call ArrayUtils.get "myArray" "$((APASH_ARRAY_FIRST_INDEX+3))"
    The output should equal "c"
    The status should be success
  End

  It 'passes when index is out of bound but a default value is provided'
    local myArray=("a" "b" "" "c")
    When call ArrayUtils.get "myArray" "-1" " "
    The output should equal " "
    The status should be success
  End
  
  It 'passes when index is out of bound but a default value is provided'
    local myArray=("a" "b" "" "c")
    When call ArrayUtils.get "myArray" "$((APASH_ARRAY_FIRST_INDEX+5))" "foo bar"
    The output should equal "foo bar"
    The status should be success
  End

End

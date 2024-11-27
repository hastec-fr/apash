Describe 'ArrayUtils.getLastIndex'
  apash.import "fr.hastec.apash.commons-lang.ArrayUtils.getLastIndex"

  It 'fails when the input name does not refere to an array'
    When call ArrayUtils.getLastIndex 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.getLastIndex ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.getLastIndex " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local myVar="test"
    When call ArrayUtils.getLastIndex "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local -A myMap=(["foo"]="bar")
    When call ArrayUtils.getLastIndex "myMap"
    The output should equal ""
    The status should be failure
  End

  It 'returns -1 when the array is empty'
    local myArray=()
    When call ArrayUtils.getLastIndex "myArray"
    The output should equal "-1"
    The status should be success
  End

  It 'passes references are arrays and value is present'
    local myArray=("a" "b" "" "c" "one two three")
    When call ArrayUtils.getLastIndex "myArray"
    The output should equal "$((APASH_ARRAY_FIRST_INDEX+4))"
    The status should be success
  End

  It 'passes references are arrays and value is present'
    local myArray=("a" "b" "c" "")
    When call ArrayUtils.getLastIndex "myArray"
    The output should equal "$((APASH_ARRAY_FIRST_INDEX+3))"
    The status should be success
  End

  It 'passes references are arrays and value is present'
    local myArray=("")
    When call ArrayUtils.getLastIndex "myArray"
    The output should equal "$APASH_ARRAY_FIRST_INDEX"
    The status should be success
  End
    
  It 'passes references are arrays and indexes are discontinued'
    local myArray=("a" "b" "" "c")
    myArray[10]=z
    When call ArrayUtils.getLastIndex "myArray"
    The output should equal "10"
    The status should be success
  End
  
  It 'passes references are arrays and value is present'
    Skip if "is zsh" global_helper_is_zsh
    local myArray=("a" "b" "" "c")
    myArray[9223372036854775807]=z
    When call ArrayUtils.getLastIndex "myArray"
    The output should equal "9223372036854775807"
    The status should be success
  End

End

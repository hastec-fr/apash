Describe 'ArrayUtils.join'
  apash.import fr.hastec.apash.commons-lang.ArrayUtils.join

  It 'fails when the input do not refere to an array'
    When call ArrayUtils.join
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the inputs do not refer to an array'
    When call ArrayUtils.join ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array'
    When call ArrayUtils.join " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array'
    local myVar="test"
    When call ArrayUtils.join "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array'
    When call ArrayUtils.join "myArray"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array'
    local -A myMap=(["foo"]="a")
    When call ArrayUtils.join "myMap"
    The output should equal ""
    The status should be failure
  End
 
  It 'passes when reference is an array'
    local myArray=()
    When call ArrayUtils.join "myArray"
    The output should equal ""
    The status should be success
  End

  It 'passes when reference is an array'
    local myArray=("a" "b" "" "c")
    When call ArrayUtils.join "myArray"
    The output should equal "a b  c"
    The status should be success
  End

  It 'passes when reference is an array'
    local myArray=("a" "b" "" "c")
    When call ArrayUtils.join "myArray" ","
    The output should equal "a,b,,c"
    The status should be success
  End

  It 'passes when reference is an array'
    local myArray=("a" "b" "" "c")
    When call ArrayUtils.join "myArray" "|1|"
    The output should equal "a|1|b|1||1|c"
    The status should be success
  End

  It 'passes even with discontinued indexes'
    local myArray=("a" "b" "" "c")
    myArray[APASH_ARRAY_FIRST_INDEX+5]="z"
    When call ArrayUtils.join "myArray" ","
    The output should equal "a,b,,c,,z"
    The status should be success
  End
End

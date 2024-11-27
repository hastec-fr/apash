Describe 'ArrayUtils.isSameLastIndex'
  apash.import fr.hastec.apash.commons-lang.ArrayUtils.isSameLastIndex

  It 'fails when the input do not refere to an array'
    When call ArrayUtils.isSameLastIndex
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the inputs do not refer to an array'
    When call ArrayUtils.isSameLastIndex "" ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array'
    When call ArrayUtils.isSameLastIndex " " " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array'
    local myVar="test"
    When call ArrayUtils.isSameLastIndex "myVar" "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array'
    When call ArrayUtils.isSameLastIndex "myArray" "myArray"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array'
    local -A myMap=(["foo"]="a")
    When call ArrayUtils.isSameLastIndex "myMap" "myMap"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array'
    local myArray=()
    When call ArrayUtils.isSameLastIndex "myArray" ""
    The output should equal ""
    The status should be failure
  End

  It 'passes when the input arrays have the same last index'
    local myArray=()
    When call ArrayUtils.isSameLastIndex "myArray" "myArray"
    The output should equal ""
    The status should be success
  End

  It 'passes when the input arrays have the same last index'
    local myArray1=("a")
    local myArray2=("b")
    When call ArrayUtils.isSameLastIndex "myArray1" "myArray2"
    The output should equal ""
    The status should be success
  End

  It 'fails when the input arrays does not have the same last index'
    local myArray1=("a")
    local myArray2=("a" "b")
    When call ArrayUtils.isSameLastIndex "myArray1" "myArray2"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input arrays does not have the same last index'
    local myArray1=("a")
    local myArray2=("a" "b")
    myArray1[10]=z
    When call ArrayUtils.isSameLastIndex "myArray1" "myArray2"
    The output should equal ""
    The status should be failure
  End

End


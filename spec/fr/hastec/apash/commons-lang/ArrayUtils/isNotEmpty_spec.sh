Describe 'ArrayUtils.isNotEmpty'
  apash.import fr.hastec.apash.commons-lang.ArrayUtils.isNotEmpty

  It 'fails when the input do not refer to an array'
    When call ArrayUtils.isNotEmpty
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input do not refer to an array'
    When call ArrayUtils.isNotEmpty ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input do not refer to an array'
    When call ArrayUtils.isNotEmpty " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input do not refer to an array'
    When call ArrayUtils.isNotEmpty "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input do not refer to an array'
    local myVar="test"
    When call ArrayUtils.isNotEmpty "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input do not refer to an array'
    local -A myMap=(["foo"]="a")
    When call ArrayUtils.isNotEmpty "myMap"
    The output should equal ""
    The status should be failure
  End

  It 'passes when the input array has elements'
    local myArray=("a")
    When call ArrayUtils.isNotEmpty "myArray"
    The output should equal ""
    The status should be success
  End

  It 'passes when the input array has elements'
    local myArray=("")
    When call ArrayUtils.isNotEmpty "myArray"
    The output should equal ""
    The status should be success
  End

  It 'fails when the input array does not have elements'
    local myArray=()
    When call ArrayUtils.isNotEmpty "myArray"
    The output should equal ""
    The status should be failure
  End

End


Describe 'ShellUtils.isVariable'
  apash.import "fr.hastec.apash.commons-lang.ShellUtils.isVariable"

  It 'fails when the input name is not a valid variable name'
    When call ShellUtils.isVariable 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name is not a valid variable name'
    When call ShellUtils.isVariable ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name has not been declared'
    unset myVar
    When call ShellUtils.isVariable "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'passes when the variable has been declared'
    local myVar="test"
    When call ShellUtils.isVariable "myVar"
    The output should equal ""
    The status should be success
  End

  It 'fails when the variable has been declared but as an array'
    declare -a myArray=()
    When call ShellUtils.isVariable "myArray"
    The output should equal ""
    The status should be failure
  End

  It 'passes when the variable has been declared but as an associative array'
    declare -a myMap=()
    When call ShellUtils.isVariable "myMap"
    The output should equal ""
    The status should be failure
  End
  
End

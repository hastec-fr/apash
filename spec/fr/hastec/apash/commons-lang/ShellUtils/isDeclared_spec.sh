Describe 'ShellUtils.isDeclared'
  apash.import "fr.hastec.apash.commons-lang.ShellUtils.isDeclared"

  It 'fails when the input name is not a valid variable name'
    When call ShellUtils.isDeclared 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name is not a valid variable name'
    When call ShellUtils.isDeclared ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name has not been declared'
    unset myVar
    When call ShellUtils.isDeclared "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'passes when the variable has been declared'
    local myVar="test"
    When call ShellUtils.isDeclared "myVar"
    The output should equal ""
    The status should be success
  End

  It 'passes when the variable has been declared'
    declare -a myArray=()
    When call ShellUtils.isDeclared "myArray"
    The output should equal ""
    The status should be success
  End

  It 'passes when the variable has been declared'
    declare -a myMap=()
    When call ShellUtils.isDeclared "myMap"
    The output should equal ""
    The status should be success
  End
  
End

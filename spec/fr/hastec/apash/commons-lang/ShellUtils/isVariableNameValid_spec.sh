Describe 'ShellUtils.isVariableNameValid'
  apash.import "fr.hastec.apash.commons-lang.ShellUtils.isVariableNameValid"

  It 'fails when the input name is not a valid variable name'
    When call ShellUtils.isVariableNameValid 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name is not a valid variable name'
    When call ShellUtils.isVariableNameValid ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid variable name'
    When call ShellUtils.isVariableNameValid "123"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid variable name'
    When call ShellUtils.isVariableNameValid "1myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid variable name'
    When call ShellUtils.isVariableNameValid "my var"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid variable name'
    When call ShellUtils.isVariableNameValid " myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid variable name'
    When call ShellUtils.isVariableNameValid "myVar "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid variable name'
    When call ShellUtils.isVariableNameValid "my#Var "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid variable name'
    When call ShellUtils.isVariableNameValid "myVér"
    The output should equal ""
    The status should be failure
  End

  It 'passes when the input name is a valid variable name'
    When call ShellUtils.isVariableNameValid "_myVar"
    The output should equal ""
    The status should be success
  End

  It 'passes when the input name is a valid variable name'
    When call ShellUtils.isVariableNameValid "myVar"
    The output should equal ""
    The status should be success
  End

  It 'passes when the input name is a valid variable name'
    When call ShellUtils.isVariableNameValid "myVar1"
    The output should equal ""
    The status should be success
  End

  It 'passes when the input name is a valid variable name'
    When call ShellUtils.isVariableNameValid "my_Var1"
    The output should equal ""
    The status should be success
  End
End

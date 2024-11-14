Describe 'BashUtils.isVariableNameValid'
  apash.import "fr.hastec.apash.commons-lang.BashUtils.isVariableNameValid"

  It 'fails when the input name is not a valid variable name'
    When call BashUtils.isVariableNameValid 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name is not a valid variable name'
    When call BashUtils.isVariableNameValid ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid variable name'
    When call BashUtils.isVariableNameValid "123"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid variable name'
    When call BashUtils.isVariableNameValid "1myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid variable name'
    When call BashUtils.isVariableNameValid "my var"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid variable name'
    When call BashUtils.isVariableNameValid " myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid variable name'
    When call BashUtils.isVariableNameValid "myVar "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid variable name'
    When call BashUtils.isVariableNameValid "my#Var "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid variable name'
    When call BashUtils.isVariableNameValid "myVér"
    The output should equal ""
    The status should be failure
  End

  It 'passes when the input name is a valid variable name'
    When call BashUtils.isVariableNameValid "_myVar"
    The output should equal ""
    The status should be success
  End

  It 'passes when the input name is a valid variable name'
    When call BashUtils.isVariableNameValid "myVar"
    The output should equal ""
    The status should be success
  End

  It 'passes when the input name is a valid variable name'
    When call BashUtils.isVariableNameValid "myVar1"
    The output should equal ""
    The status should be success
  End

  It 'passes when the input name is a valid variable name'
    When call BashUtils.isVariableNameValid "my_Var1"
    The output should equal ""
    The status should be success
  End
End

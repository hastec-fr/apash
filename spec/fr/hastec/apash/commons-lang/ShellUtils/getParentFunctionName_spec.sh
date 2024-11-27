Describe 'ShellUtils.getParentFunctionName'
  apash.import "fr.hastec.apash.commons-lang.ShellUtils.getParentFunctionName"

  # Can't evaluate due to shellspec functions
  # It 'fails when no current function exists'
  #   When call ShellUtils.getParentFunctionName
  #   The output should equal ""
  #   The status should be failure
  # End

  # It 'fails when parent function exists'
  #   myCaller(){ ShellUtils.getParentFunctionName ; }
  #   When call myCaller
  #   The output should equal "myCaller"
  #   The status should be failure
  # End

  It 'passes when the input depth is defined'
    myCaller(){ ShellUtils.getParentFunctionName ; }
    myGrandCaller() { myCaller ;}
    When call myGrandCaller
    The output should equal "myGrandCaller"
    The status should be success
  End
End

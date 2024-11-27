Describe 'ShellUtils.getFunctionName'
  apash.import "fr.hastec.apash.commons-lang.ShellUtils.getFunctionName"

  It 'passes when the input depth is valid'
    When call ShellUtils.getFunctionName $((APASH_ARRAY_FIRST_INDEX+0))
    The output should equal "ShellUtils.getFunctionName"
    The status should be success
  End
  
  It 'passes when the input depth is not defined'
    myCaller(){ ShellUtils.getFunctionName ; }
    When call myCaller
    The output should equal "myCaller"
    The status should be success
  End

  It 'passes when the input depth is defined'
    myCaller(){ ShellUtils.getFunctionName $((APASH_ARRAY_FIRST_INDEX+1)) ; }
    When call myCaller
    The output should equal "myCaller"
    The status should be success
  End
End

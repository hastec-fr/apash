Describe 'BashUtils.getFunctionName'
  apash.import "fr.hastec.apash.commons-lang.BashUtils.getFunctionName"

  It 'passes when the input depth is valid'
    When call BashUtils.getFunctionName $((APASH_ARRAY_FIRST_INDEX+0))
    The output should equal "BashUtils.getFunctionName"
    The status should be success
  End
  
  It 'passes when the input depth is not defined'
    myCaller(){ BashUtils.getFunctionName ; }
    When call myCaller
    The output should equal "myCaller"
    The status should be success
  End

  It 'passes when the input depth is defined'
    myCaller(){ BashUtils.getFunctionName $((APASH_ARRAY_FIRST_INDEX+1)) ; }
    When call myCaller
    The output should equal "myCaller"
    The status should be success
  End
End

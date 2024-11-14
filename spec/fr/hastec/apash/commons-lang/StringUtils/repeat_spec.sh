Describe 'StringUtils.repeat'
  apash.import "fr.hastec.apash.commons-lang.StringUtils.repeat"

  It 'fails when input is not a valid positive number'
    When call StringUtils.repeat a "a"
    The output should equal ""
    The status should be failure
  End

  It 'returns the repeated string'
    When call StringUtils.repeat  3 "a"
    The output should equal "aaa"
    The status should be success
  End

  It 'returns the repeated string'
    When call StringUtils.repeat  2 "ab"
    The output should equal "abab"
    The status should be success
  End
  
End

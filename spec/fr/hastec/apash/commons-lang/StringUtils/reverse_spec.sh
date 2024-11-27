Describe 'StringUtils.reverse'
  apash.import "fr.hastec.apash.commons-lang.StringUtils.reverse"

  It 'returns empty string input string is empty'
    When call StringUtils.reverse
    The output should equal ""
    The status should be success
  End

  It 'returns empty string input string is empty'
    When call StringUtils.reverse ""
    The output should equal ""
    The status should be success
  End

  It 'returns the reversed string'
    When call StringUtils.reverse "bat"
    The output should equal "tab"
    The status should be success
  End

  It 'returns the reversed string'
    When call StringUtils.reverse "bat man"
    The output should equal "nam tab"
    The status should be success
  End

End

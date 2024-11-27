Describe 'StringUtils.lowerCase'
  apash.import "fr.hastec.apash.commons-lang.StringUtils.lowerCase"

  It 'returns an empty string when input string is empty'
    When call StringUtils.lowerCase ""
    The output should equal ""
    The status should be success
  End

  It 'returns converted string to lower cases'
    When call StringUtils.lowerCase "ABC"
    The output should equal "abc"
    The status should be success
  End

  It 'returns converted string to lower cases'
    When call StringUtils.lowerCase "AbC"
    The output should equal "abc"
    The status should be success
  End

  It 'returns converted string to lower cases'
    When call StringUtils.lowerCase "A123B"
    The output should equal "a123b"
    The status should be success
  End

  It 'returns converted string to lower cases'
    When call StringUtils.lowerCase "abc"
    The output should equal "abc"
    The status should be success
  End

  It 'returns converted string to lower cases'
    When call StringUtils.lowerCase "CRÈME BRÛLÉE"
    The output should equal "crème brûlée"
    The status should be success
  End

End

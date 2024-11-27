Describe 'StringUtils.containsOnly'
  apash.import "fr.hastec.apash.commons-lang.StringUtils.containsOnly"

  It 'fails when inputs string is not null but charsequence is'
    When call StringUtils.containsOnly "abc" ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when string does not contains only provided characters'
    When call StringUtils.containsOnly "ab1" "abc"
    The output should equal ""
    The status should be failure
  End

  It 'fails when string does not contains only provided characters'
    When call StringUtils.containsOnly "abz" "abc"
    The output should equal ""
    The status should be failure
  End

  It 'fails when string does not contains only provided characters'
    When call StringUtils.containsOnly "a[bd" "a[bc"
    The output should equal ""
    The status should be failure
  End

  It 'passes without arguments'
    When call StringUtils.containsOnly
    The output should equal ""
    The status should be success
  End

  It 'passes with empty input string'
    When call StringUtils.containsOnly ""
    The output should equal ""
    The status should be success
  End

  It 'passes with empty input string'
    When call StringUtils.containsOnly "" ""
    The output should equal ""
    The status should be success
  End

  It 'passes with empty input string'
    When call StringUtils.containsOnly "" "abc"
    The output should equal ""
    The status should be success
  End

  It 'passes when string contains only provided characters'
    When call StringUtils.containsOnly "abab" "abc"
    The output should equal ""
    The status should be success
  End

  It 'passes when string contains only provided characters'
    When call StringUtils.containsOnly  "a[b" "a[bc"
    The output should equal ""
    The status should be success
  End

End

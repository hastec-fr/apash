Describe 'StringUtils.contains'
  apash.import "fr.hastec.apash.commons-lang.StringUtils.contains"

  It 'passes with empty input string'
    When call StringUtils.contains ""
    The output should equal ""
    The status should be success
  End

  It 'passes with empty input string'
    When call StringUtils.contains "" ""
    The output should equal ""
    The status should be success
  End
  
  It 'fails with empty input string'
    When call StringUtils.contains "" "abc"
    The output should equal ""
    The status should be failure
  End

  It 'passes when inputs string is not null but char sequence is'
    When call StringUtils.contains "abc" ""
    The output should equal ""
    The status should be success
  End

  It 'fails when inputs string does not match the full char sequence'
    When call StringUtils.contains "ab" "abc"
    The output should equal ""
    The status should be failure
  End

  It 'fails when string does not contains the char sequence'
    When call StringUtils.contains "ab1c" "abc"
    The output should equal ""
    The status should be failure
  End

  It 'fails when string does not contains the char sequence even using cardinality'
    When call StringUtils.contains "abc" "a*bc"
    The output should equal ""
    The status should be failure
  End

  It 'passes without arguments'
    When call StringUtils.contains
    The output should equal ""
    The status should be success
  End

  It 'passes when string contains only provided char sequence'
    When call StringUtils.contains "abc" "abc"
    The output should equal ""
    The status should be success
  End

  It 'passes when string contains more than provided char sequence'
    When call StringUtils.contains "abcde" "bcd"
    The output should equal ""
    The status should be success
  End

End

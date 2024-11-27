Describe 'StringUtils.rightPad'
  apash.import "fr.hastec.apash.commons-lang.StringUtils.rightPad"

  It 'returns an empty string when the number to pad is empty'
    When call StringUtils.rightPad "" "" ""
    The output should equal ""
    The status should be failure
  End

  It 'returns an empty string when the number to pad is not numeric'
    When call StringUtils.rightPad "" "a" " "
    The output should equal ""
    The status should be failure
  End

  It 'returns an empty string when the number to pad is negative'
    When call StringUtils.rightPad "" "-1" "z"
    The output should equal ""
    The status should be failure
  End

  It 'returns an empty string when the number to pad is a float'
    When call StringUtils.rightPad "" "1.2" "z"
    The output should equal ""
    The status should be failure
  End

  It 'returns string with necessary suffix'
    When call StringUtils.rightPad "" "3" "z"
    The output should equal "zzz"
    The status should be success
  End

  It 'returns string with necessary suffix'
    When call StringUtils.rightPad "bat" "5" "yz"
    The output should equal "batyz"
    The status should be success
  End

  It 'returns string with necessary suffix'
    When call StringUtils.rightPad "bat" "8" "yz"
    The output should equal "batyzyzy"
    The status should be success
  End

  It 'returns string with necessary suffix'
    When call StringUtils.rightPad "bat" "5" "abcdefg"
    The output should equal "batab"
    The status should be success
  End
  
  It 'returns string with necessary suffix'
    When call StringUtils.rightPad "" "1" "yz"
    The output should equal "y"
    The status should be success
  End

  It 'returns the original string when this string is longer than required size'
    When call StringUtils.rightPad "bat" "3" "yz"
    The output should equal "bat"
    The status should be success
  End

  It 'returns the original string when this string is longer than required size'
    When call StringUtils.rightPad "" "0" "yz"
    The output should equal ""
    The status should be success
  End

  It 'returns string with necessary suffix set to space when the pad string is empty'
    When call StringUtils.rightPad "bat" "5" ""
    The output should equal "bat  "
    The status should be success
  End

End

Describe 'StringUtils.leftPad'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.StringUtils.leftPad"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF    

  It 'returns an empty string when the number to pad is empty'
    When call StringUtils.leftPad "" "" ""
    The output should equal ""
    The status should be failure
  End

  It 'returns an empty string when the number to pad is not numeric'
    When call StringUtils.leftPad "" "a" " "
    The output should equal ""
    The status should be failure
  End

  It 'returns an empty string when the number to pad is negative'
    When call StringUtils.leftPad "" "-1" "z"
    The output should equal ""
    The status should be failure
  End

  It 'returns an empty string when the number to pad is a float'
    When call StringUtils.leftPad "" "1.2" "z"
    The output should equal ""
    The status should be failure
  End

  It 'returns string with necessary prefix'
    When call StringUtils.leftPad "" "3" "z"
    The output should equal "zzz"
    The status should be success
  End

  It 'returns string with necessary prefix'
    When call StringUtils.leftPad "bat" "5" "yz"
    The output should equal "yzbat"
    The status should be success
  End

  It 'returns string with necessary prefix'
    When call StringUtils.leftPad "bat" "8" "yz"
    The output should equal "yzyzybat"
    The status should be success
  End

  It 'returns string with necessary prefix'
    When call StringUtils.leftPad "bat" "5" "abcdefg"
    The output should equal "abbat"
    The status should be success
  End
  
  It 'returns string with necessary prefix'
    When call StringUtils.leftPad "" "1" "yz"
    The output should equal "y"
    The status should be success
  End

  It 'returns the original string when this string is longer than required size'
    When call StringUtils.leftPad "bat" "3" "yz"
    The output should equal "bat"
    The status should be success
  End

  It 'returns the original string when this string is longer than required size'
    When call StringUtils.leftPad "" "0" "yz"
    The output should equal ""
    The status should be success
  End

  It 'returns string with necessary prefix set to space when the pad string is empty'
    When call StringUtils.leftPad "bat" "5" ""
    The output should equal "  bat"
    The status should be success
  End

End

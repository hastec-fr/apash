Describe 'StringUtils.rotate'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.StringUtils.rotate"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF    

  It 'returns empty string when shift is not parsable'
    When call StringUtils.rotate "abc" " "
    The output should equal ""
    The status should be failure
  End

  It 'returns empty string when shift is not parsable'
    When call StringUtils.rotate "abc" "a"
    The output should equal ""
    The status should be failure
  End

  It 'returns empty string when shift is not parsable'
    When call StringUtils.rotate "abc" "1a"
    The output should equal ""
    The status should be failure
  End

  It 'returns the original string when shift 0 or empty'
    When call StringUtils.rotate
    The output should equal ""
    The status should be success
  End

  It 'returns the original string when shift 0 or empty'
    When call StringUtils.rotate ""
    The output should equal ""
    The status should be success
  End

  It 'returns the original string when shift 0 or empty'
    When call StringUtils.rotate "" ""
    The output should equal ""
    The status should be success
  End

  It 'returns the original string when shift 0 or empty'
    When call StringUtils.rotate "abc" ""
    The output should equal "abc"
    The status should be success
  End

  It 'returns the original string when shift 0 or empty'
    When call StringUtils.rotate "" "0"
    The output should equal ""
    The status should be success
  End

  It 'returns the original string when shift 0 or empty'
    When call StringUtils.rotate "abc"
    The output should equal "abc"
    The status should be success
  End

  It 'returns the original string when shift 0 or empty'
    When call StringUtils.rotate "abc" "0"
    The output should equal "abc"
    The status should be success
  End

  It 'returns the string with right rotation when shift is greater than 0'
    When call StringUtils.rotate "abcdefg" "2"
    The output should equal "fgabcde"
    The status should be success
  End

  It 'returns the string with right rotation when shift is greater than 0'
    When call StringUtils.rotate  "abcdefg" "7"
    The output should equal "abcdefg"
    The status should be success
  End
  
  It 'returns the string with right rotation when shift is greater than 0'
    When call StringUtils.rotate  "abcdefg" "9"
    The output should equal "fgabcde"
    The status should be success
  End

  It 'returns the string with left rotation when shift is less than 0'
    When call StringUtils.rotate "abcdefg" "-2"
    The output should equal "cdefgab"
    The status should be success
  End

  It 'returns the string with left rotation when shift is less than 0'
    When call StringUtils.rotate "abcdefg" "-7"
    The output should equal "abcdefg"
    The status should be success
  End

  It 'returns the string with left rotation when shift is less than 0'
    When call StringUtils.rotate "abcdefg" "-9"
    The output should equal "cdefgab"
    The status should be success
  End

End

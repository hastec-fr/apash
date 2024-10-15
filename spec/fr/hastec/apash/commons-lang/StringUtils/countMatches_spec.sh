Describe 'StringUtils.countMatches'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.StringUtils.countMatches"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi    

  It 'returns 0 if string or substring are empty'
    When call StringUtils.countMatches "" ""
    The output should equal '0'
    The status should be success
  End

  It 'returns 0 if string or substring are empty'
    When call StringUtils.countMatches "" "a"
    The output should equal '0'
    The status should be success
  End

  It 'returns 0 if string or substring are empty'
    When call StringUtils.countMatches "abba" ""
    The output should equal '0'
    The status should be success
  End

  It 'returns the number of occurence of the substring within the string'
    When call StringUtils.countMatches "abba" "a"
    The output should equal '2'
    The status should be success
  End

  It 'returns the number of occurence of the substring within the string'
    When call StringUtils.countMatches "abba" "ab"
    The output should equal '1'
    The status should be success
  End

  It 'returns the number of occurence of the substring within the string'
    When call StringUtils.countMatches "abba" "xxx"
    The output should equal '0'
    The status should be success
  End

End

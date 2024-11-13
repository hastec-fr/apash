Describe 'StringUtils.indexOf'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.StringUtils.indexOf"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF    

  It 'returns 0 without arguments'
    When call StringUtils.indexOf
    The output should equal "0"
    The status should be success
  End

  It 'returns 0 with empty arguments'
    When call StringUtils.indexOf "" ""
    The output should equal "0"
    The status should be success
  End

  It 'returns -1 when string to check is empty and search is not empty'
    When call StringUtils.indexOf "" "*"
    The output should equal "-1"
    The status should be success
  End
  
  It 'returns 0 when string to check is not empty and search is empty'
    When call StringUtils.indexOf "aabaabaa" ""
    The output should equal "0"
    The status should be success
  End

  It 'returns 2 when third character is matching'
    When call StringUtils.indexOf "aabaabaa" "b"
    The output should equal "2"
    The status should be success
  End

  It 'returns 1 when first sequence character is matching at second letter'
    When call StringUtils.indexOf "aabaabaa" "ab"
    The output should equal "1"
    The status should be success
  End

  It 'returns -1 when research is not matching in the string'
    When call StringUtils.indexOf "aabaabaa" "mn"
    The output should equal "-1"
    The status should be success
  End

  It 'returns 0 when research is completly matching the string'
    When call StringUtils.indexOf "aabaabaa" "aabaabaa"
    The output should equal "0"
    The status should be success
  End
End

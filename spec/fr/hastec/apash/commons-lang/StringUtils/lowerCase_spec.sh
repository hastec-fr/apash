Describe 'StringUtils.lowerCase'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.StringUtils.lowerCase"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF    

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

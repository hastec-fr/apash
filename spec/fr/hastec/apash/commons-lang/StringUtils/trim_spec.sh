Describe 'StringUtils.trim'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.StringUtils.trim"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi    

  It 'returns string without leading and tailing whitespaces but preserve middle spaces'
    When call StringUtils.trim "   Hello   World   "
    The output should equal "Hello   World"
    The status should be success
  End

  It 'returns empty string no characters are present'
    When call StringUtils.trim ""
    The output should equal ""
    The status should be success
  End

  It 'returns empty string no argument is present'
    When call StringUtils.trim
    The output should equal ""
    The status should be success
  End

  It 'returns empty string when only whitespaces are present (including tabs)'
    When call StringUtils.trim "   	  "
    The output should equal ""
    The status should be success
  End

  It 'returns string without leading spaces'
    When call StringUtils.trim "   Hello World"
    The output should equal "Hello World"
    The status should be success
  End

  It 'returns string without tailing spaces'
    When call StringUtils.trim "Hello World     "
    The output should equal "Hello World"
    The status should be success
  End

  It 'returns the current value if no space to trim'
    When call StringUtils.trim "Hello World"
    The output should equal "Hello World"
    The status should be success
  End
End

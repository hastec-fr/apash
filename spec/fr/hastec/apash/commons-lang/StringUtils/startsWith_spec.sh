Describe 'StringUtils.startsWith'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.StringUtils.startsWith"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi    

  It 'passes when the two arguments are empty'
    When call StringUtils.startsWith
    The output should equal ""
    The status should be success
  End

  It 'passes with empty arguments'
    When call StringUtils.startsWith "" ""
    The output should equal ""
    The status should be success
  End

  It 'passes when prefix is empty'
    When call StringUtils.startsWith "abcd" ""
    The output should equal ""
    The status should be success
  End

  It 'passes when prefix match with the start of the string'
    When call StringUtils.startsWith "abcd" "ab"
    The output should equal ""
    The status should be success
  End

  It 'fails when prefix does not match with the start of the string'
    When call StringUtils.startsWith "abcd" "c"
    The output should equal ""
    The status should be failure
  End

  It 'fails when prefix (longer) does not match with the start of the string'
    When call StringUtils.startsWith "abcd" "abd"
    The output should equal ""
    The status should be failure
  End

  It 'fails when prefix is not empty but the string is empty'
    When call StringUtils.startsWith "abcd" "abd"
    The output should equal ""
    The status should be failure
  End
  
End

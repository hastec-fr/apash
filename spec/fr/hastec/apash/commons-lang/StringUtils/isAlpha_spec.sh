Describe 'StringUtils.isAlpha'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.StringUtils.isAlpha"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF    

  It 'fails when input string is empty'
    When call StringUtils.isAlpha
    The output should equal ""
    The status should be failure
  End

  It 'fails when input string is blank'
    When call StringUtils.isAlpha "    "
    The output should equal ""
    The status should be failure
  End


  It 'passes when input string contains only letters'
    When call StringUtils.isAlpha "abc"
    The output should equal ""
    The status should be success
  End

  It 'passes when input string contains only letters'
    When call StringUtils.isAlpha "aBc"
    The output should equal ""
    The status should be success
  End

  It 'passes when input string contains only letters'
    When call StringUtils.isAlpha "aBéc"
    The output should equal ""
    The status should be success
  End

  It 'fails when input string contains other characters than letters'
    When call StringUtils.isAlpha "ab-c"
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when input string contains other characters than letters'
    When call StringUtils.isAlpha "ab2c"
    The output should equal ""
    The status should be failure
  End

  It 'fails when input string contains other characters than letters'
    When call StringUtils.isAlpha "abc def"
    The output should equal ""
    The status should be failure
  End
End

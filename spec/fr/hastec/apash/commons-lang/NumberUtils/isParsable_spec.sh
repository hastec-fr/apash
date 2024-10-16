Describe 'NumberUtils.isParsable'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.NumberUtils.isParsable"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input number is empty'
    When call NumberUtils.isParsable
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input number is empty'
    When call NumberUtils.isParsable ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the string has other char than digits, potential minus or dot'
    When call NumberUtils.isParsable " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the string has other char than digits, potential minus or dot'
    When call NumberUtils.isParsable " 12"
    The output should equal ""
    The status should be failure
  End


  It 'passes when the string has only digits, potential minus or dot'
    When call NumberUtils.isParsable "1e2"
    The output should equal ""
    The status should be failure
  End

  It 'passes when the string has only digits, potential minus or dot'
    When call NumberUtils.isParsable "123"
    The output should equal ""
    The status should be success
  End
  
  It 'passes when the string has only digits, potential minus or dot'
    When call NumberUtils.isParsable "-12"
    The output should equal ""
    The status should be success
  End

  It 'passes when the string has only digits, potential minus or dot'
    When call NumberUtils.isParsable "000"
    The output should equal ""
    The status should be success
  End

  It 'passes when the string has only digits, potential minus or dot'
    When call NumberUtils.isParsable "1"
    The output should equal ""
    The status should be success
  End

  It 'passes when the string has only digits, potential minus or dot'
    When call NumberUtils.isParsable "-123.45"
    The output should equal ""
    The status should be success
  End

  It 'passes when the string has only digits, potential minus or dot'
    When call NumberUtils.isParsable ".123"
    The output should equal ""
    The status should be success
  End

  It 'passes when the string has only digits, potential minus or dot'
    When call NumberUtils.isParsable "-.123"
    The output should equal ""
    The status should be success
  End
  
  It 'fails when the string is not parsable'
    When call NumberUtils.isParsable "--12"
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the string is not parsable'
    When call NumberUtils.isParsable "1-2"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the string is not parsable'
    When call NumberUtils.isParsable "1."
    The output should equal ""
    The status should be failure
  End

  It 'fails when the string is not parsable'
    When call NumberUtils.isParsable "0x1"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the string is not parsable'
    When call NumberUtils.isParsable "0x1"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the string is not parsable'
    When call NumberUtils.isParsable "12L"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the string is not parsable'
    When call NumberUtils.isParsable "12e3"
    The output should equal ""
    The status should be failure
  End
End

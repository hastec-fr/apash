Describe 'NumberUtils.isInteger'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.NumberUtils.isInteger"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input number is empty'
    When call NumberUtils.isInteger 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input number is empty'
    When call NumberUtils.isInteger ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the string contains other char than digits'
    When call NumberUtils.isInteger " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the string contains other char than digits'
    When call NumberUtils.isInteger "1.2"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the string contains other char than digits'
    When call NumberUtils.isInteger "1e2"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the string contains other char than digits'
    When call NumberUtils.isInteger " 12"
    The output should equal ""
    The status should be failure
  End

  It 'passes when the string contains only digits and an optional minus sign.'
    When call NumberUtils.isInteger "123"
    The output should equal ""
    The status should be success
  End

  It 'passes when the string contains only digits and an optional minus sign.'
    When call NumberUtils.isInteger "-12"
    The output should equal ""
    The status should be success
  End

  It 'passes when the string contains only digits and an optional minus sign.'
    When call NumberUtils.isInteger "000"
    The output should equal ""
    The status should be success
  End

  It 'passes when the string contains only digits and an optional minus sign.'
    When call NumberUtils.isInteger "1"
    The output should equal ""
    The status should be success
  End

End

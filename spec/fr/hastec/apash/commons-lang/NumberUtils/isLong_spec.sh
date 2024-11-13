Describe 'NumberUtils.isLong'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.NumberUtils.isLong"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF

  It 'fails when the input number is empty'
    When call NumberUtils.isLong 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input number is empty'
    When call NumberUtils.isLong ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the string contains other char than digits'
    When call NumberUtils.isLong " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the string contains other char than digits'
    When call NumberUtils.isLong "1.2"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the string contains other char than digits'
    When call NumberUtils.isLong "1e2"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the string contains other char than digits'
    When call NumberUtils.isLong " 12"
    The output should equal ""
    The status should be failure
  End

  It 'passes when the string contains only digits and an optional minus sign'
    When call NumberUtils.isLong "123"
    The output should equal ""
    The status should be success
  End

  It 'passes when the string contains only digits and an optional minus sign'
    When call NumberUtils.isLong "-12"
    The output should equal ""
    The status should be success
  End

  It 'passes when the string contains only digits and an optional minus sign'
    When call NumberUtils.isLong "000"
    The output should equal ""
    The status should be success
  End

  It 'passes when the string contains only digits and an optional minus sign'
    When call NumberUtils.isLong "1"
    The output should equal ""
    The status should be success
  End
  
  It 'passes when the string is inside the bounds'
    When call NumberUtils.isLong "$Long_MAX_VALUE"
    The output should equal ""
    The status should be success
  End

  It 'passes when the string is inside the bounds'
    When call NumberUtils.isLong "$Long_MIN_VALUE"
    The output should equal ""
    The status should be success
  End

  It 'fails when the string is out of the bounds'
    When call NumberUtils.isLong "9223372036854775808"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the string is out of the bounds'
    When call NumberUtils.isLong "-9223372036854775809"
    The output should equal ""
    The status should be failure
  End
End

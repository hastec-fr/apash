Describe 'NumberUtils.compare'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.NumberUtils.compare"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF

  It 'fails when the inputs are not integers'
    When call NumberUtils.compare 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the inputs are not integers'
    When call NumberUtils.compare "" ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs are not integers'
    When call NumberUtils.compare "a" "0"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs are not integers'
    When call NumberUtils.compare "1.2" "0"
    The output should equal ""
    The status should be failure
  End

  It 'returns 0 when numbers are equals'
    When call NumberUtils.compare "0" "0"
    The output should equal "0"
    The status should be success
  End

  It 'returns 0 when numbers are equals'
    When call NumberUtils.compare "2" "2"
    The output should equal "0"
    The status should be success
  End

  It 'returns 0 when numbers are equals'
    When call NumberUtils.compare "-2" "-2"
    The output should equal "0"
    The status should be success
  End
  
  It 'returns value greater than 0 when first number is greater than the second'
    When call NumberUtils.compare "2" "1"
    The output should equal "1"
    The status should be success
  End

  It 'returns value greater than 0 when first number is greater than the second'
    When call NumberUtils.compare "10" "-1"
    The output should equal "11"
    The status should be success
  End

  It 'returns value greater than 0 when first number is greater than the second'
    When call NumberUtils.compare "-1" "-2"
    The output should equal "1"
    The status should be success
  End

  It 'returns value smaller than 0 when first number is less than the second'
    When call NumberUtils.compare "1" "2"
    The output should equal "-1"
    The status should be success
  End

  It 'returns value smaller than 0 when first number is less than the second'
    When call NumberUtils.compare "-1" "10"
    The output should equal "-11"
    The status should be success
  End

  It 'returns value smaller than 0 when first number is less than the second'
    When call NumberUtils.compare "-2" "-1"
    The output should equal "-1"
    The status should be success
  End

End

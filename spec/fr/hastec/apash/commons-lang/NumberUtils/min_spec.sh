Describe 'NumberUtils.min'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.NumberUtils.min"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF

  It 'returns empty value when at least one input is not parsable'
    When call NumberUtils.min
    The output should equal ""
    The status should be failure
  End
  
  It 'returns empty value when at least one input is not parsable'
    When call NumberUtils.min ""
    The output should equal ""
    The status should be failure
  End

  It 'returns empty value when at least one input is not parsable'
    When call NumberUtils.min "a"
    The output should equal ""
    The status should be failure
  End

  It 'returns empty value when at least one input is not parsable'
    When call NumberUtils.min "0" "a"
    The output should equal ""
    The status should be failure
  End

  It 'returns empty value when at least one input is not parsable'
    When call NumberUtils.min "0" "1" ""
    The output should equal ""
    The status should be failure
  End

  It 'returns the smaller value from a list of numbers'
    When call NumberUtils.min "0" "2" "1"
    The output should equal "0"
    The status should be success
  End

  It 'returns the smaller value from a list of numbers'
    When call NumberUtils.min "-2" "-3" "-4"
    The output should equal "-4"
    The status should be success
  End

  It 'returns the smaller value from a list of numbers'
    When call NumberUtils.min "0.123" ".099" "-1"
    The output should equal "-1"
    The status should be success
  End

  It 'returns the smaller value from a list of numbers'
    When call NumberUtils.min "-.123" "0.123" ".123"
    The output should equal "-.123"
    The status should be success
  End

  It 'returns the smaller value from a list of numbers'
    When call NumberUtils.min "000" "0" "00"
    The output should equal "000"
    The status should be success
  End
  
End

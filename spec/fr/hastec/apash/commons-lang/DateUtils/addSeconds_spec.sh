Describe 'DateUtils.addSeconds'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.DateUtils.addSeconds"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF
  # Apply timezone for the tests
  export TZ="Europe/Paris"

  It 'fails because format is not respected'
    When call DateUtils.addSeconds 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails because format is not respected'
    When call DateUtils.addSeconds "" 1
    The output should equal ""
    The status should be failure
  End

  It 'fails because format is not respected'
    When call DateUtils.addSeconds "20240914" 1
    The output should equal ""
    The status should be failure
  End

  It 'fails because format is not respected'
    When call DateUtils.addSeconds "2024-09-14T10:30" 1
    The output should equal ""
    The status should be failure
  End

  It 'fails because format is not respected'
    When call DateUtils.addSeconds "2024-03-4T14:30:45.123+0000" 1
    The output should equal ""
    The status should be failure
  End

  It 'fails because format of the number to add is invalid'
    When call DateUtils.addSeconds "2024-03-14T14:30:45.123+0000" "a"
    The output should equal ""
    The status should be failure
  End

  It 'returns the new Date with the added amount of seconds'
    When call DateUtils.addSeconds "2024-04-01T14:00:00.123+0200" 1
    The output should equal "2024-04-01T14:00:01.123+0200"
    The status should be success
  End

  It 'returns the new Date with the added amount of seconds'
    When call DateUtils.addSeconds "2024-04-01T14:00:00.123+0200" -1
    The output should equal "2024-04-01T13:59:59.123+0200"
    The status should be success
  End

  It 'returns the new Date with the added amount of seconds'
    When call DateUtils.addSeconds "2024-04-01T14:00:00.123+0200" 60
    The output should equal "2024-04-01T14:01:00.123+0200"
    The status should be success
  End

  It 'returns the new Date with the added amount of seconds'
    When call DateUtils.addSeconds "2024-04-01T14:00:00.123+0200" -60
    The output should equal "2024-04-01T13:59:00.123+0200"
    The status should be success
  End

  It 'returns the new Date with the added amount of seconds during Summer daylight saving'
    When call DateUtils.addSeconds "2024-04-01T01:59:59.123+0100" 1
    The output should equal "2024-04-01T03:00:00.123+0200"
    The status should be success
  End

  # Gnu known bug
  # It 'returns the new Date with the added amount of seconds during Summer daylight saving'
  #   When call DateUtils.addSeconds "2024-04-01T03:00:00.123+0200" -1
  #   The output should equal "2024-04-01T01:59:59.123+0100"
  #   The status should be success
  # End

  It 'returns the new Date with the added amount of seconds during Winter daylight saving'
    When call DateUtils.addSeconds "2024-11-01T02:59:59.123+0200" 1
    The output should equal "2024-11-01T02:00:00.123+0100"
    The status should be success
  End

  # Gnu known bug
  # It 'returns the new Date with the added amount of seconds during Winter daylight saving'
  #   When call DateUtils.addSeconds "2024-11-01T02:00:00.123+0100" -1
  #   The output should equal "2024-11-01T02:59:59.123+0200"
  #   The status should be success
  # End

End


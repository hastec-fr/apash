Describe 'DateUtils.addYears'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.DateUtils.addYears"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  # Apply timezone for the tests
  export TZ="Europe/Paris"

  It 'fails because format is not respected'
    When call DateUtils.addYears 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails because format is not respected'
    When call DateUtils.addYears "" 1
    The output should equal ""
    The status should be failure
  End

  It 'fails because format is not respected'
    When call DateUtils.addYears "20240914" 1
    The output should equal ""
    The status should be failure
  End

  It 'fails because format is not respected'
    When call DateUtils.addYears "2024-09-14T10:30" 1
    The output should equal ""
    The status should be failure
  End

  It 'fails because format is not respected'
    When call DateUtils.addYears "2024-03-4T14:30:45.123+0000" 1
    The output should equal ""
    The status should be failure
  End

  It 'fails because format of the number to add is invalid'
    When call DateUtils.addYears "2024-03-14T14:30:45.123+0000" "a"
    The output should equal ""
    The status should be failure
  End

  It 'returns the new Date with the added amount of weeks'
    When call DateUtils.addYears "2024-04-01T14:00:00.123+0200" 1
    The output should equal "2025-04-01T14:00:00.123+0200"
    The status should be success
  End

  It 'returns the new Date with the added amount of weeks'
    When call DateUtils.addYears "2024-04-01T14:00:00.123+0200" -1
    The output should equal "2023-04-01T14:00:00.123+0200"
    The status should be success
  End

End

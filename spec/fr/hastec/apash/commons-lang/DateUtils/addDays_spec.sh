Describe 'DateUtils.addDays'
  apash.import "fr.hastec.apash.commons-lang.DateUtils.addDays"
  
  # Apply timezone for the tests
  set TZ="Europe/Paris"

  It 'fails because format is not respected'
    When call DateUtils.addDays 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails because format is not respected'
    When call DateUtils.addDays "" 1
    The output should equal ""
    The status should be failure
  End

  It 'fails because format is not respected'
    When call DateUtils.addDays "20240914" 1
    The output should equal ""
    The status should be failure
  End

  It 'fails because format is not respected'
    When call DateUtils.addDays "2024-09-14T10:30" 1
    The output should equal ""
    The status should be failure
  End

  It 'fails because format is not respected'
    When call DateUtils.addDays "2024-03-4T14:30:45.123+0000" 1
    The output should equal ""
    The status should be failure
  End

  It 'fails because format of the number to add is invalid'
    When call DateUtils.addDays "2024-03-14T14:30:45.123+0000" "a"
    The output should equal ""
    The status should be failure
  End

  It 'returns the new Date with the added amount of days'
    When call DateUtils.addDays "2024-03-14T14:30:45.123+0100" 1
    The output should equal "2024-03-15T14:30:45.123+0100"
    The status should be success
  End

  It 'returns the new Date with the added amount of days'
    When call DateUtils.addDays "2024-03-14T14:30:45.123+0100" -1
    The output should equal "2024-03-13T14:30:45.123+0100"
    The status should be success
  End

  It 'returns the new Date with the added amount of days'
    When call DateUtils.addDays "2024-04-01T14:30:45.123+0200" 365
    The output should equal "2025-04-01T14:30:45.123+0200"
    The status should be success
  End


  # Summer Time 
  # @todo: mail sent to GNU, because result is not the expected one ?
  # Gnu known bug
  # It 'return the date during Summer daylight saving'
  #   export TZ="Europe/Paris"
  #   When call DateUtils.addDays "2024-03-30T02:30:00.123+0100" 1
  #   The output should equal "2024-03-31T03:30:00.123+0200" # expectation
  ##  The output should equal "2024-03-31T04:30:00.123+0200" # actual
  #   The status should be success
  # End

  It 'return the date during Summer daylight saving'
    When call DateUtils.addDays "2024-03-31T03:30:00.123+0200" -1
    The output should equal "2024-03-30T02:30:00.123+0100"
    The status should be success
  End

  It 'return the date during Winter daylight saving'
    When call DateUtils.addDays "2023-10-28T03:30:00.123+0200" 1
    The output should equal "2023-10-29T02:30:00.123+0100"
    The status should be success
  End

  # The reverse operation does not look to change the TZ, has been reported to GNU.
  # Answer: The bug is known, only a workaround available (anchoring at 12:00) until more global change on 
  # date time management.
  # https://www.gnu.org/software/coreutils/faq/coreutils-faq.html#The-date-command-is-not-working-right_002e
  # Gnu known bug
  # It 'return the date during Winter daylight saving'
  #   export TZ="Europe/Paris"
  #   When call DateUtils.addDays "2023-10-29T03:30:00.123+0200" -1
  #   The output should equal "2023-10-28T03:30:00.123+0100" # expectation
  ##  The output should equal "2023-10-28T03:30:00.123+0100" # actual
  #   The status should be success
  # End
End


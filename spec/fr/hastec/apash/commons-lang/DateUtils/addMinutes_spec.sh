Describe 'DateUtils.addMinutes'
  apash.import "fr.hastec.apash.commons-lang.DateUtils.addMinutes"
  
  # Apply timezone for the tests
  set TZ="Europe/Paris"

  It 'fails because format is not respected'
    When call DateUtils.addMinutes 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails because format is not respected'
    When call DateUtils.addMinutes "" 1
    The output should equal ""
    The status should be failure
  End

  It 'fails because format is not respected'
    When call DateUtils.addMinutes "20240914" 1
    The output should equal ""
    The status should be failure
  End

  It 'fails because format is not respected'
    When call DateUtils.addMinutes "2024-09-14T10:30" 1
    The output should equal ""
    The status should be failure
  End

  It 'fails because format is not respected'
    When call DateUtils.addMinutes "2024-03-4T14:30:45.123+0000" 1
    The output should equal ""
    The status should be failure
  End

  It 'fails because format of the number to add is invalid'
    When call DateUtils.addMinutes "2024-03-14T14:30:45.123+0000" "a"
    The output should equal ""
    The status should be failure
  End

  It 'returns the new Date with the added amount of minutes'
    When call DateUtils.addMinutes "2024-03-14T14:00:00.123+0100" 1
    The output should equal "2024-03-14T14:01:00.123+0100" 
    The status should be success
  End

  It 'returns the new Date with the added amount of minutes'
    When call DateUtils.addMinutes "2024-03-14T14:00:00.123+0100" -1
    The output should equal "2024-03-14T13:59:00.123+0100"
    The status should be success
  End

  It 'returns the new Date with the added amount of minutes'
    When call DateUtils.addMinutes "2024-03-31T14:00:00.123+0000" 60
    The output should equal "2024-03-31T17:00:00.123+0200"
    The status should be success
  End

  It 'returns the new Date with the added amount of minutes'
    When call DateUtils.addMinutes "2024-03-31T16:00:00.123+0200" -60
    The output should equal "2024-03-31T15:00:00.123+0200"
    The status should be success
  End

  It 'returns the new Date with the added amount of minutes during Summer daylight saving'
    When call DateUtils.addMinutes "2024-03-31T01:59:00.123+0100" 1 
    The output should equal "2024-03-31T03:00:00.123+0200"
    The status should be success
  End

  It 'returns the new Date with the added amount of minutes during Winter daylight saving'
    When call DateUtils.addMinutes "2024-10-29T02:59:00.123+0200" 1
    The output should equal "2024-10-29T02:00:00.123+0100"
    The status should be success
  End

End


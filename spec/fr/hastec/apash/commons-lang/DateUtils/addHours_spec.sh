Describe 'DateUtils.addHours'
  apash.import "fr.hastec.apash.commons-lang.DateUtils.addHours"
  
  # Apply timezone for the tests
  export TZ="Europe/Paris"

  It 'fails because format is not respected'
    When call DateUtils.addHours 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails because format is not respected'
    When call DateUtils.addHours "" 1
    The output should equal ""
    The status should be failure
  End

  It 'fails because format is not respected'
    When call DateUtils.addHours "20240914" 1
    The output should equal ""
    The status should be failure
  End

  It 'fails because format is not respected'
    When call DateUtils.addHours "2024-09-14T10:30" 1
    The output should equal ""
    The status should be failure
  End

  It 'fails because format is not respected'
    When call DateUtils.addHours "2024-03-4T14:30:45.123+0000" 1
    The output should equal ""
    The status should be failure
  End

  It 'fails because format of the number to add is invalid'
    When call DateUtils.addHours "2024-03-14T14:30:45.123+0000" "a"
    The output should equal ""
    The status should be failure
  End

  It 'returns the new Date with the added amount of hours'
    When call DateUtils.addHours "2024-03-14T14:30:45.123+0100" 1
    The output should equal "2024-03-14T15:30:45.123+0100"
    The status should be success
  End

  It 'returns the new Date with the added amount of hours'
    When call DateUtils.addHours "2024-03-14T14:30:45.123+0100" -1
    The output should equal "2024-03-14T13:30:45.123+0100"
    The status should be success
  End

  It 'returns the new Date with the added amount of hours'
    When call DateUtils.addHours "2024-03-31T14:30:45.123+0000" 24
    The output should equal "2024-04-01T16:30:45.123+0200"
    The status should be success
  End

  It 'returns the new Date with the added amount of hours'
    When call DateUtils.addHours "2024-04-01T14:30:45.123+0000" -24
    The output should equal "2024-03-31T16:30:45.123+0200"
    The status should be success
  End

  It 'returns the new Date with the added amount of hours during Summer daylight saving'
    When call DateUtils.addHours "2024-03-30T02:30:00.123+0100" 24
    The output should equal "2024-03-31T03:30:00.123+0200" 
    The status should be success
  End

  It 'returns the new Date with the added amount of hours during Winter daylight saving'
    When call DateUtils.addHours "2024-10-28T03:30:00.123+0200" 24
    The output should equal "2024-10-29T02:30:00.123+0100" 
    The status should be success
  End

End


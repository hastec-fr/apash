Describe 'DateUtils.isDate'
  apash.import "fr.hastec.apash.commons-lang.DateUtils.isDate"
  
  # Apply timezone for the tests
  [  -n "${MSYSTEM:-}" ] && set TZ="Europe/Paris" || export TZ="Europe/Paris"

  It 'fails because format is not respected'
    When call DateUtils.isDate 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails because format is not respected'
    When call DateUtils.isDate ""
    The output should equal ""
    The status should be failure
  End

  It 'fails because format is not respected'
    When call DateUtils.isDate "20240914"
    The output should equal ""
    The status should be failure
  End

  It 'fails because format is not respected'
    When call DateUtils.isDate "2024-09-14T10:30"
    The output should equal ""
    The status should be failure
  End

  It 'fails because format is not respected'
    When call DateUtils.isDate "2024-03-4T14:30:45.123"
    The output should equal ""
    The status should be failure
  End

  It 'fails because format is not respected'
    When call DateUtils.isDate "yersteday"
    The output should equal ""
    The status should be failure
  End

  It 'fails because format is not respected'
    When call DateUtils.isDate "1 week ago"
    The output should equal ""
    The status should be failure
  End

  It 'fails because format is not respected'
    When call DateUtils.isDate "2024-02-30T30:30:45.123+0000" "1.2"
    The output should equal ""
    The status should be failure
  End

  It 'passes because format of the date is respected'
    When call DateUtils.isDate "2022-03-14T14:30:45.123+0200"
    The output should equal ""
    The status should be success
  End

End

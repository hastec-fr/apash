Describe 'NumberUtils.max'
  apash.import "fr.hastec.apash.commons-lang.NumberUtils.max"

  It 'returns empty value when at least one input is not parsable'
    When call NumberUtils.max
    The output should equal ""
    The status should be failure
  End
  
  It 'returns empty value when at least one input is not parsable'
    When call NumberUtils.max ""
    The output should equal ""
    The status should be failure
  End

  It 'returns empty value when at least one input is not parsable'
    When call NumberUtils.max "a"
    The output should equal ""
    The status should be failure
  End

  It 'returns empty value when at least one input is not parsable'
    When call NumberUtils.max "0" "a"
    The output should equal ""
    The status should be failure
  End

  It 'returns empty value when at least one input is not parsable'
    When call NumberUtils.max "0" "1" ""
    The output should equal ""
    The status should be failure
  End

  It 'returns the greater value from a list of numbers'
    When call NumberUtils.max "0" "2" "1"
    The output should equal "2"
    The status should be success
  End

  It 'returns the greater value from a list of numbers'
    When call NumberUtils.max "-2" "-3" "-4"
    The output should equal "-2"
    The status should be success
  End

  It 'returns the greater value from a list of numbers'
    When call NumberUtils.max "0.123" ".099" "-1"
    The output should equal "0.123"
    The status should be success
  End

  It 'returns the greater value from a list of numbers'
    When call NumberUtils.max "-.123" "0.123" ".123"
    The output should equal "0.123"
    The status should be success
  End

  It 'returns the greater value from a list of numbers'
    When call NumberUtils.max "000" "0" "00"
    The output should equal "000"
    The status should be success
  End
  
End

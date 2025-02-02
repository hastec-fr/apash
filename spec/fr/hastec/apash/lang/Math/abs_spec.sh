Describe 'Math.abs'
  apash.import "fr.hastec.apash.lang.Math.abs"

  It 'returns empty value when the input number is not parsable'
    When call Math.abs
    The output should equal ""
    The status should be failure
  End
  
  It 'returns empty value when the input number is not parsable'
    When call Math.abs ""
    The output should equal ""
    The status should be failure
  End

  It 'returns empty value when the input number is not parsable'
    When call Math.abs "a"
    The output should equal ""
    The status should be failure
  End

  It 'returns empty value when the input number is not parsable'
    When call Math.abs "a12"
    The output should equal ""
    The status should be failure
  End

  It 'returns empty value when the input number is not parsable'
    When call Math.abs " 12"
    The output should equal ""
    The status should be failure
  End

  It 'returns empty value when the input number is not parsable'
    When call Math.abs "--12"
    The output should equal ""
    The status should be failure
  End

  It 'returns empty value when the input number is not parsable'
    When call Math.abs "1-2"
    The output should equal ""
    The status should be failure
  End

  It 'returns empty value when the input number is not parsable'
    When call Math.abs  "1."
    The output should equal ""
    The status should be failure
  End

  It 'returns empty value when the input number is not parsable'
    When call Math.abs "0x1"
    The output should equal ""
    The status should be failure
  End

  It 'returns empty value when the input number is not parsable'
    When call Math.abs "12L"
    The output should equal ""
    The status should be failure
  End

  It 'returns empty value when the input number is not parsable'
    When call Math.abs "12e3"
    The output should equal ""
    The status should be failure
  End

  It 'returns the absolute value of the argument'
    When call Math.abs "123"
    The output should equal "123"
    The status should be success
  End

  It 'returns the absolute value of the argument'
    When call Math.abs "-12"
    The output should equal "12"
    The status should be success
  End
  
  It 'returns the absolute value of the argument'
    When call Math.abs "000"
    The output should equal "000"
    The status should be success
  End

  It 'returns the absolute value of the argument'
    When call Math.abs "1"
    The output should equal "1"
    The status should be success
  End

  It 'returns the absolute value of the argument'
    When call Math.abs "-123.45"
    The output should equal "123.45"
    The status should be success
  End

  It 'returns the absolute value of the argument'
    When call Math.abs ".123"
    The output should equal ".123"
    The status should be success
  End

  It 'returns the absolute value of the argument'
    When call Math.abs "-.123"
    The output should equal ".123"
    The status should be success
  End

End

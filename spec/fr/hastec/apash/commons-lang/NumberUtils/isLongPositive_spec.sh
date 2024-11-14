Describe 'NumberUtils.isLongPositive'
  apash.import "fr.hastec.apash.commons-lang.NumberUtils.isLongPositive"

  It 'fails when the input number is empty'
    When call NumberUtils.isLongPositive 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input number is empty'
    When call NumberUtils.isLongPositive ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the string contains other char than digits'
    When call NumberUtils.isLongPositive " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the string contains other char than digits'
    When call NumberUtils.isLongPositive "1.2"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the string contains other char than digits'
    When call NumberUtils.isLongPositive "1e2"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the string contains other char than digits'
    When call NumberUtils.isLongPositive " 12"
    The output should equal ""
    The status should be failure
  End

  It 'passes when the string contains only digits greater than 0'
    When call NumberUtils.isLongPositive "123"
    The output should equal ""
    The status should be success
  End

  It 'passes when the string contains only digits greater than 0'
    When call NumberUtils.isLongPositive "000"
    The output should equal ""
    The status should be success
  End

  It 'passes when the string contains only digits greater than 0'
    When call NumberUtils.isLongPositive "1"
    The output should equal ""
    The status should be success
  End
  
  It 'passes when the string is inside the bounds'
    When call NumberUtils.isLongPositive "$Long_MAX_VALUE"
    The output should equal ""
    The status should be success
  End
    
  It 'fails when the string is out of the bounds'
    When call NumberUtils.isLongPositive "9223372036854775808"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the number is negative'
    Skip if "is zsh" global_helper_is_zsh
    When call NumberUtils.isLongPositive "$Long_MIN_VALUE"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the number is negative'
    When call NumberUtils.isLongPositive "-12"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the number is negative'
    Skip if "is zsh" global_helper_is_zsh
    When call NumberUtils.isLongPositive "-922337203685477580"
    The output should equal ""
    The status should be failure
  End

  # @todo: Not supported by zsh after 18 chars including the sign
  # Ref: https://www.bouledef.eu/~tleguern/articles/shell-overflow/
  It 'fails when the number is negative'
    Skip if "is zsh" global_helper_is_zsh
    When call NumberUtils.isLongPositive "-9223372036854775809"
    The output should equal ""
    The status should be failure
  End
End

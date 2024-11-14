Describe 'Random.nextInt'
  apash.import "fr.hastec.apash.util.Random.nextInt"

  # https://github.com/shellspec/shellspec/blob/master/docs/references.md#matchers
  value() {
    # The subject is stored in the same variable name as the function name
    test "${value:?}" "$1" "$2"
  }


  It 'returns integer between bounds'
    local myInt=$(Random.nextInt)
    When call NumberUtils.isInteger $myInt
    The output should equal ""
    The status should be success
  End
  
  It 'returns integer between bounds'
    When call Random.nextInt 10
    The status should be success
    The output should satisfy value -ge 10
  End

  It 'returns integer between bounds'
    When call Random.nextInt 0 10
    The status should be success
    The output should satisfy value -ge 0
    The output should satisfy value -lt 10 
  End

  It 'returns integer between bounds'
    When call Random.nextInt -10 0
    The status should be success
    The output should satisfy value -ge -10
    The output should satisfy value -lt 0 
  End

  It 'returns integer between bounds'
    When call Random.nextInt 10 20
    The status should be success
    The output should satisfy value -ge 10
    The output should satisfy value -lt 20 
  End

  It 'returns integer between bounds'
    When call Random.nextInt -20 -10
    The status should be success
    The output should satisfy value -ge -20
    The output should satisfy value -lt -10 
  End

  It 'returns integer between bounds'
    When call Random.nextInt 5 5
    The output should equal "5"
    The status should be success
  End

  It 'fails when numbers are not integers'
    When call Random.nextInt ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when numbers are not integers'
    When call Random.nextInt "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when numbers are not integers'
    When call Random.nextInt "1" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when numbers are not integers'
    When call Random.nextInt "3147483647"
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when numbers are not integers'
    When call Random.nextInt "-3147483648"
    The output should equal ""
    The status should be failure
  End

  It 'fails when numbers are not integers'
    When call Random.nextInt 0 "3147483647"
    The output should equal ""
    The status should be failure
  End

  It 'fails when numbers are not integers'
    When call Random.nextInt "-3147483648" 0
    The output should equal ""
    The status should be failure
  End

  It 'fails when min value is greater than maxValue'
    When call Random.nextInt 10 1
    The output should equal ""
    The status should be failure
  End

  It 'fails when min value is greater than maxValue'
    When call Random.nextInt 0 -1
    The output should equal ""
    The status should be failure
  End
End

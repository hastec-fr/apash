Describe 'StringUtils.endsWith'
  apash.import "fr.hastec.apash.commons-lang.StringUtils.endsWith"

  It 'passes with no arguments'
    When call StringUtils.endsWith
    The output should equal ""
    The status should be success
  End

  It 'passes with empty arguments'
    When call StringUtils.endsWith "" ""
    The output should equal ""
    The status should be success
  End

  It 'passes when suffix is empty'
    When call StringUtils.endsWith "abcd" ""
    The output should equal ""
    The status should be success
  End

  It 'passes when suffix match with the end of the string'
    When call StringUtils.endsWith "abcd" "cd"
    The output should equal ""
    The status should be success
  End

  It 'fails when suffix does not match with the end of the string'
    When call StringUtils.endsWith "abcd" "c"
    The output should equal ""
    The status should be failure
  End

  It 'fails when suffix is longer than the string'
    When call StringUtils.endsWith "abcd" "abcde"
    The output should equal ""
    The status should be failure
  End

  It 'fails when suffix does not match with the full end of the string'
    When call StringUtils.endsWith "abcd" "bd"
    The output should equal ""
    The status should be failure
  End

  It 'fails when suffix is not empty but the string is empty'
    When call StringUtils.endsWith "" "c"
    The output should equal ""
    The status should be failure
  End

  It 'fails when suffix has some pattern symbols not matching the end of the string'
    When call StringUtils.endsWith "apash" ".sh"
    The output should equal ""
    The status should be failure
  End

  It 'passes when suffix has some pattern symbols matching the end of the string'
    When call StringUtils.endsWith "apash.sh" ".sh"
    The output should equal ""
    The status should be success
  End
End

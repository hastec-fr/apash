Describe 'StringUtils.abbreviate'
  apash.import "fr.hastec.apash.commons-lang.StringUtils.abbreviate"

  # Failures
  It 'fails without valid max length'
    When call StringUtils.abbreviate
    The output should equal ""
    The status should be failure
  End

  It 'fails without valid max length'
    When call StringUtils.abbreviate "abcdef" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails without valid max length'
    When call StringUtils.abbreviate "abcdef" "1.2"
    The output should equal ""
    The status should be failure
  End

  It 'fails with abnormal max width and offset'
    When call StringUtils.abbreviate "abcdefghij" 3 0
    The output should equal ""
    The status should be failure
  End

  It 'fails with abnormal max width and offset'
    When call StringUtils.abbreviate "abcdefghij" 6 5
    The output should equal ""
    The status should be failure
  End

  It 'fails with abnormal max width and offset and delimiter'
    When call StringUtils.abbreviate "abcdefghij" 4 0 "abra"
    The output should equal ""
    The status should be failure
  End

  It 'fails with abnormal max width and offset and delimiter'
    When call StringUtils.abbreviate "abcdefghij" 6 5 "..."
    The output should equal ""
    The status should be failure
  End

  # Success
  It 'passes with only max width value declared'
    When call StringUtils.abbreviate "" 4
    The output should equal ""
    The status should be success
  End

  It 'passes with only max width value declared'
    When call StringUtils.abbreviate "abcdefg" 6
    The output should equal "abc..."
    The status should be success
  End

  It 'passes with only max width value declared'
    When call StringUtils.abbreviate "abcdefg" 7
    The output should equal 'abcdefg'
    The status should be success
  End

  It 'passes with only max width value declared'
    When call StringUtils.abbreviate "abcdefg" 8
    The output should equal 'abcdefg'
    The status should be success
  End

  It 'passes with only max width value declared'
    When call StringUtils.abbreviate "abcdefg" 4
    The output should equal 'a...'
    The status should be success
  End

  It 'passes with only max width and offset declared'
    When call StringUtils.abbreviate "" 4 0
    The output should equal ""
    The status should be success
  End

  It 'passes with only max width and offset declared'
    When call StringUtils.abbreviate "abcdefghijklmno" 10 -1
    The output should equal "abcdefg..."
    The status should be success
  End

  It 'passes with only max width and offset declared'
    When call StringUtils.abbreviate "abcdefghijklmno" 10 0
    The output should equal "abcdefg..."
    The status should be success
  End

  It 'passes with only max width and offset declared'
    When call StringUtils.abbreviate "abcdefghijklmno" 10 1
    The output should equal "abcdefg..."
    The status should be success
  End

  It 'passes with only max width and offset declared'
    When call StringUtils.abbreviate "abcdefghijklmno" 10 4
    The output should equal "abcdefg..."
    The status should be success
  End

  It 'passes with only max width and offset declared'
    When call StringUtils.abbreviate "abcdefghijklmno" 10 5
    The output should equal "...fghi..."
    The status should be success
  End

  It 'passes with only max width and offset declared'
    When call StringUtils.abbreviate "abcdefghijklmno" 10 6
    The output should equal "...ghij..."
    The status should be success
  End

  It 'passes with only max width and offset declared'
    When call StringUtils.abbreviate "abcdefghijklmno" 10 8
    The output should equal "...ijklmno"
    The status should be success
  End

  It 'passes with only max width and offset declared'
    When call StringUtils.abbreviate "abcdefghijklmno" 10 10
    The output should equal "...ijklmno"
    The status should be success
  End

  It 'passes with only max width and offset declared'
    When call StringUtils.abbreviate "abcdefghijklmno" 10 12
    The output should equal "...ijklmno"
    The status should be success
  End

  It 'passes with everything declared'
    When call StringUtils.abbreviate  "" 4 0 "..."
    The output should equal ""
    The status should be success
  End

  It 'passes with everything declared'
    When call StringUtils.abbreviate "abcdefghijklmno" 10 -1 "---"
    The output should equal "abcdefg---"
    The status should be success
  End
  
  It 'passes with everything declared'
    When call StringUtils.abbreviate "abcdefghijklmno" 10 0 ","
    The output should equal "abcdefghi,"
    The status should be success
  End

  It 'passes with everything declared'
    When call StringUtils.abbreviate "abcdefghijklmno" 10 1 ","
    The output should equal "abcdefghi,"
    The status should be success
  End

  It 'passes with everything declared'
    When call StringUtils.abbreviate "abcdefghijklmno" 10 1 ","
    The output should equal "abcdefghi,"
    The status should be success
  End

  It 'passes with everything declared'
    When call StringUtils.abbreviate "abcdefghijklmno" 10 2 ","
    The output should equal "abcdefghi,"
    The status should be success
  End

  It 'passes with everything declared'
    When call StringUtils.abbreviate "abcdefghijklmno" 10 4 "::"
    The output should equal "::efghij::"
    The status should be success
  End

  It 'passes with everything declared'
    When call StringUtils.abbreviate "abcdefghijklmno" 10 6 "..."
    The output should equal "...ghij..."
    The status should be success
  End

  It 'passes with everything declared'
    When call StringUtils.abbreviate "abcdefghijklmno" 10 9 '*'
    The output should equal "*ghijklmno"
    The status should be success
  End

  It 'passes with everything declared'
    When call StringUtils.abbreviate "abcdefghijklmno" 10 10 "'"
    The output should equal "'ghijklmno"
    The status should be success
  End

  It 'passes with everything declared'
    When call StringUtils.abbreviate "abcdefghijklmno" 10 12 "!"
    The output should equal "!ghijklmno"
    The status should be success
  End

End

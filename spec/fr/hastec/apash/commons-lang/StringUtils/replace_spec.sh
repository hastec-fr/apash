Describe 'StringUtils.replace'
  apash.import "fr.hastec.apash.commons-lang.StringUtils.replace"

  It 'returns an empty string when the input string is empty'
    When call StringUtils.replace "" "" ""
    The output should equal ""
    The status should be success
  End

  It 'returns an empty string when the input string is empty'
    When call StringUtils.replace "" "a" "d"
    The output should equal ""
    The status should be success
  End


  It 'returns the full string if the substring to remove is empty'
    When call StringUtils.replace "any" "" "d"
    The output should equal "any"
    The status should be success
  End

  It 'returns the string without occurence of the substring if replacement is empty'
    When call StringUtils.replace "ab:cd:ef" ":" ""
    The output should equal "abcdef"
    The status should be success
  End

  It 'returns the string without occurence of the substring if replacement is empty'
    When call StringUtils.replace "abab::cd:ab:ef::ab" "ab" ""
    The output should equal "::cd::ef::"
    The status should be success
  End

  It 'returns the string without occurence of the substring if replacement is empty'
    When call StringUtils.replace $'ab: cd:\nef gh:\nij ' $'\n' ""
    The output should equal "ab: cd:ef gh:ij "
    The status should be success
  End
  
  It 'returns the string without occurence of the substring if replacement is empty'
    When call StringUtils.replace "queued" "ue" ""
    The output should equal "qd"
    The status should be success
  End

  It 'returns the string without occurence of the substring if replacement is empty'
    When call StringUtils.replace "/path/to/delete" "to/" ""
    The output should equal "/path/delete"
    The status should be success
  End

  It 'returns the string without occurence of the substring if replacement is empty'
    When call StringUtils.replace "((var(to)delete)" "(to" ""
    The output should equal "((var)delete)"
    The status should be success
  End

  It 'returns the string without occurence of the substring if replacement is empty'
    When call StringUtils.replace  "aba" "a" ""
    The output should equal "b"
    The status should be success
  End

  It ' returns the orginal string if no occurence of the substring occurs'
    When call StringUtils.replace "aba" "z" "x"
    The output should equal "aba"
    The status should be success
  End

  It 'returns the string with any replacements processed'
    When call StringUtils.replace "aba" "a" "z"
    The output should equal "zbz"
    The status should be success
  End

  It 'returns the string with any replacements processed'
    When call StringUtils.replace $'abc\ndef\nfgh'  "e"   "x"
    The output should equal $'abc\ndxf\nfgh'
    The status should be success
  End

  It 'returns the string with any replacements processed'
    When call StringUtils.replace "/path/to/replace" "to/" "xz/"
    The output should equal "/path/xz/replace"
    The status should be success
  End

  It 'returns the string with any replacements processed'
    When call StringUtils.replace "(var(to) to replace)" "(to)" "(is)"
    The output should equal "(var(is) to replace)"
    The status should be success
  End

End

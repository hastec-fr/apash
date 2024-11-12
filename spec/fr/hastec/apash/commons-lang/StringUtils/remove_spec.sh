Describe 'StringUtils.remove'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.StringUtils.remove"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi    

  It 'returns an empty string when the input string is empty'
    When call StringUtils.remove "" ""
    The output should equal ""
    The status should be success
  End

  It 'returns an empty string when the input string is empty'
    When call StringUtils.remove "" ":"
    The output should equal ""
    The status should be success
  End

  It 'returns the full string if the substring to remove is empty '
    When call StringUtils.remove "queued" ""
    The output should equal "queued"
    The status should be success
  End

  It 'returns the full string if the substring to remove is empty '
    When call StringUtils.remove $'ab:cd:\nef' ""
    The output should equal $'ab:cd:\nef'
    The status should be success
  End

  It 'returns the string without occurence of the substring to remove'
    When call StringUtils.remove "ab:cd:ef" ":"
    The output should equal "abcdef"
    The status should be success
  End

  It 'returns the string without occurence of the substring to remove'
    When call StringUtils.remove "abab::cd:ab:ef::ab" "ab"
    The output should equal "::cd::ef::"
    The status should be success
  End

  It 'returns the string without occurence of the substring to remove'
    When call StringUtils.remove $'ab: cd:\nef gh:\nij ' $'\n'
    The output should equal "ab: cd:ef gh:ij "
    The status should be success
  End
  
  It 'returns the string without occurence of the substring to remove'
    When call StringUtils.remove "queued" "ue"
    The output should equal "qd"
    The status should be success
  End

  It 'returns the string without occurence of the substring to remove'
    When call StringUtils.remove "/path/to/delete" "to/"
    The output should equal "/path/delete"
    The status should be success
  End

  It 'returns the string without occurence of the substring to remove'
    When call StringUtils.remove "((var(to)delete)" "(to"
    The output should equal "((var)delete)"
    The status should be success
  End
  
End

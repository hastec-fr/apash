Describe 'StringUtils.split'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.StringUtils.split"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi    

  # @todo: check with shell spec the support of array for null length.
  It 'returns an empty array when the input string is empty'
    When call StringUtils.split myArray "" ""
    The output should equal ""
    The status should be success
    The value  "${#myArray[@]}" should eq 0
  End

  It 'returns an empty array when the input string is empty'
    When call StringUtils.split myArray "" ":"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 0
  End

  It 'returns the full string if the delimiter is empty'
    When call StringUtils.split myArray "ab:cd:ef" ""
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 1
    The variable 'myArray[0]' should eq "ab:cd:ef"
  End

  It 'returns the full string if the delimiter is empty'
    When call StringUtils.split myArray $'ab:cd:\nef' ""
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 1
    The variable 'myArray[0]' should eq $'ab:cd:\nef'
  End

  It 'returns the correct number of elements according to sequence occurence'
    When call StringUtils.split myArray "ab:cd:ef" ":"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 3
    The variable 'myArray[0]' should eq "ab"
    The variable 'myArray[1]' should eq "cd"
    The variable 'myArray[2]' should eq "ef"
  End

  It 'returns the correct number of elements according to sequence occurence'
    When call StringUtils.split myArray $'ab: cd:\nef gh:\nij ' ":"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[0]' should eq "ab"
    The variable 'myArray[1]' should eq " cd"
    The variable 'myArray[2]' should eq $'\nef gh'
    The variable 'myArray[3]' should eq $'\nij '
  End

  It 'returns the correct number of elements according to sequence occurence'
    When call StringUtils.split myArray "ab:cd:ef" "cd"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 2
    The variable 'myArray[0]' should eq "ab:"
    The variable 'myArray[1]' should eq ":ef"
  End

  It 'returns item even when adjacent delimiter are encountered'
    When call StringUtils.split myArray "ab::cd:ef" ":"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 3
    The variable 'myArray[0]' should eq "ab"
    The variable 'myArray[1]' should eq "cd"
    The variable 'myArray[2]' should eq "ef"
  End

  It 'returns item even when adjacent delimiter are encountered'
    When call StringUtils.split myArray $'ab\n\ncd\nef' $'\n'
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 3
    The variable 'myArray[0]' should eq "ab"
    The variable 'myArray[1]' should eq "cd"
    The variable 'myArray[2]' should eq "ef"
  End

  # @todo: same issue than with bats-core. Ticket to log.
  # It 'returns item even when adjacent delimiter are encountered'
  #   When call StringUtils.split myArray "::ab::cd:::ef::" ":"
  #   The output should equal ""
  #   The status should be success
  #   The value "${#myArray[@]}" should eq 3
  #   The variable 'myArray[0]' should eq "ab"
  #   The variable 'myArray[1]' should eq "cd"
  #   The variable 'myArray[2]' should eq "ef"
  # End
  
  # It 'returns item even when adjacent delimiter are encountered'
  #   When call StringUtils.split myArray "abab::cd:ab:ef::ab" "ab"
  #   The output should equal ""
  #   The status should be success
  #   The value "${#myArray[@]}" should eq 3
  #   The variable 'myArray[0]' should eq "::cd:" 
  #   The variable 'myArray[1]' should eq ":ef::"
  # End

End

Describe 'StringUtils.splitAny'
  apash.import "fr.hastec.apash.commons-lang.StringUtils.splitAny"

  # @todo: check with shell spec the support of array for null length.
  It 'returns an empty array when the input string is empty'
    When call StringUtils.splitAny myArray "" ""
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 0
  End

  It 'returns an empty array when the input string is empty'
    When call StringUtils.splitAny myArray "" ":"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 0
  End

  It 'returns the full string if the delimiter is empty'
    When call StringUtils.splitAny myArray "ab:cd,ef" ""
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 1
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "ab:cd,ef"
  End

  It 'returns the full string if the delimiter is empty'
    When call StringUtils.splitAny myArray $'ab:cd,\nef' ""
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 1
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq $'ab:cd,\nef'
  End

  It 'returns the correct number of elements according to sequence occurence'
    When call StringUtils.splitAny myArray "ab:cd:ef" ":"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 3
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "ab"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "cd"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "ef"
  End
  
  It 'returns the correct number of elements according to sequence occurence'
    When call StringUtils.splitAny myArray "ab:cd,ef" ":" ","
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 3
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "ab"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "cd"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "ef"
  End

  It 'returns the correct number of elements according to sequence occurence'
    When call StringUtils.splitAny myArray $'ab: cd,\nef gh:\nij ' ":" ","
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "ab"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq " cd"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq $'\nef gh'
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq $'\nij '
  End

  It 'returns the correct number of elements according to sequence occurence'
    When call StringUtils.splitAny myArray "ab:cd:e,f" "cd" ","
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 3
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "ab:"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq ":e"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "f"
  End

  It 'returns item even when adjacent delimiter are encountered'
    When call StringUtils.splitAny myArray "ab::cd,,ef" ":" ","
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 3
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "ab"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "cd"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "ef"
  End

  It 'returns item even when adjacent delimiter are encountered'
    When call StringUtils.splitAny myArray $'ab\n\ncd,ef' $'\n' ","
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 3
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "ab"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "cd"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "ef"
  End

  # @todo: same issue than with bats-core. Ticket to log.
  # It 'returns item even when adjacent delimiter are encountered'
  #   When call StringUtils.splitAny myArray "::ab::cd:::ef::" ":"
  #   The output should equal ""
  #   The status should be success
  #   The value "${#myArray[@]}" should eq 3
  #   The variable 'myArray[0]' should eq "ab"
  #   The variable 'myArray[1]' should eq "cd"
  #   The variable 'myArray[2]' should eq "ef"
  # End
  
  # It 'returns item even when adjacent delimiter are encountered'
  #   When call StringUtils.splitAny myArray "abab::cd:ab:ef::ab" "ab"
  #   The output should equal ""
  #   The status should be success
  #   The value "${#myArray[@]}" should eq 3
  #   The variable 'myArray[0]' should eq "::cd:" 
  #   The variable 'myArray[1]' should eq ":ef::"
  # End

End

Describe '<Class>.<Method>'
  apash.import "<Package>.<Class>.<Method>"

  It 'fails when the input is wrong'
    When call <Class>.<Method> 
    The output should equal ""
    The status should be failure
  End

  It 'passes when the input is right'
    local -a myArray=(a b c)
    When call <Class>.<Method> myArray
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 3
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
  End

End

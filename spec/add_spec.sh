Describe 'ArrayUtils.add'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash/commons-lang/ArrayUtils/add.sh"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi    

  It 'passes when reference is an array and value is a string'
    When call ArrayUtils.add "myArray" "a"
    The output should equal ""
    The status should be success
    The variable "${#myArray[@]}" should eq 1
    The variable 'myArray[@]' should eq "a"
  End

  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.add 
    The output should equal ""
    The status should be failure
  End

End

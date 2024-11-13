Describe 'ArrayUtils.initWithValue'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.initWithValue
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF

  It 'fails when the input name is not a valid array name'
    When call ArrayUtils.initWithValue
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name is not a valid array name'
    When call ArrayUtils.initWithValue ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid array name'
    When call ArrayUtils.initWithValue " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid array name'
    When call ArrayUtils.initWithValue "my var"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid array name'
    When call ArrayUtils.initWithValue "1myvar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid array name'
    local myVar="test"
    When call ArrayUtils.initWithValue "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid array name'
    local -A myMap=(["foo"]="bar")
    When call ArrayUtils.initWithValue "myMap"
    The output should equal ""
    The status should be failure
  End

  It 'passes when no value provided'
    unset "myArray"
    When call ArrayUtils.initWithValue "myArray" 2
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 2
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq ""
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq ""
  End

  It 'passes when an init value is provided'
    local myArray=()
    When call ArrayUtils.initWithValue "myArray" 3 0
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 3
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "0"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "0"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "0"
  End

  It 'passes when init value is composed of multiple characters'
    local myArray=()
    When call ArrayUtils.initWithValue "myArray" 2 "ah!"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 2
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "ah!"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "ah!"
  End
End


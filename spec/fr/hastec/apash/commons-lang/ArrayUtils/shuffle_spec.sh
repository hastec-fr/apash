Describe 'ArrayUtils.shuffle'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.shuffle
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.contains
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.shuffle
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input does not refer to an array'
    When call ArrayUtils.shuffle ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.shuffle " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name refer to variable which is not an array'
    local myVar="test"
    When call ArrayUtils.shuffle "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name refer to variable which is not an array'
    local -A myMap=(["foo"]="a")
    When call ArrayUtils.shuffle "myMap"
    The output should equal ""
    The status should be failure
  End
 
  It 'passes when the reference is an array'
    local myArray=("a" "b" "c" "d")
    When call ArrayUtils.shuffle "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 4
    Assert ArrayUtils.contains myArray "a"
    Assert ArrayUtils.contains myArray "b"
    Assert ArrayUtils.contains myArray "c"
    Assert ArrayUtils.contains myArray "d"
  End

  It 'passes when the reference is an array'
    local myArray=("a")
    When call ArrayUtils.shuffle "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 1
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
  End

  It 'passes when the reference is an array'
    local myArray=()
    When call ArrayUtils.shuffle "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 0
  End
End


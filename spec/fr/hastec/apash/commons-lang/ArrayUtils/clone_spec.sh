Describe 'ArrayUtils.clone'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash/commons-lang/ArrayUtils/clone.sh"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.clone 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.clone ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.clone " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local myVar="test"
    When call ArrayUtils.clone "myVar" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local -A myMap=(["foo"]="bar")
    When call ArrayUtils.clone "myArray" "myClone"
    The output should equal ""
    The status should be failure
  End

  It 'passes when references are arrays'
    local myArray=()
    local myClone=("a")
    When call ArrayUtils.clone "myArray" "myClone"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 0
    The value "${#myClone[@]}" should eq 0
  End

  It 'passes when references are arrays'
    local myArray=("a" "b" "" "c")
    local myClone=("d" "e" "f")
    When call ArrayUtils.clone "myArray" "myClone"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "b"
    The variable 'myArray[2]' should eq ""
    The variable 'myArray[3]' should eq "c"
    The value "${#myClone[@]}" should eq 4
    The variable 'myClone[0]' should eq "a"
    The variable 'myClone[1]' should eq "b"
    The variable 'myClone[2]' should eq ""
    The variable 'myClone[3]' should eq "c"
  End

  It 'passes when references are arrays'
    local myArray=("a" "b" "" "c")
    local myClone=()
    When call ArrayUtils.clone "myArray" "myClone"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "b"
    The variable 'myArray[2]' should eq ""
    The variable 'myArray[3]' should eq "c"
    The value "${#myClone[@]}" should eq 4
    The variable 'myClone[0]' should eq "a"
    The variable 'myClone[1]' should eq "b"
    The variable 'myClone[2]' should eq ""
    The variable 'myClone[3]' should eq "c"
  End
End

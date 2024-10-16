Describe 'ArrayUtils.remove'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.remove
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.remove
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input does not refer to an array'
    When call ArrayUtils.remove ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input does not refer to an array'
    When call ArrayUtils.remove " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name refer to variable which is not an array'
    local myVar="a"
    When call ArrayUtils.remove "myVar" 0
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name refer to variable which is not an array'
    local -A myMap=(["foo"]="a")
    When call ArrayUtils.remove "myMap" 0
    The output should equal ""
    The status should be failure
  End
 
  It 'passes when the reference is an arrays the index is valid'
    local myArray=("a" "b" "c" "" "d")
    When call ArrayUtils.remove "myArray" 4
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 4
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "b"
    The variable 'myArray[2]' should eq "c"
    The variable 'myArray[3]' should eq ""
  End

  It 'passes when the reference is an arrays the index is valid'
    local myArray=("a" "b" "c" "")
    When call ArrayUtils.remove "myArray" 2
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 3
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "b"    
    The variable 'myArray[2]' should eq ""
  End

  It 'passes when the reference is an arrays the index is valid'
    local myArray=("a" "b" "")
    When call ArrayUtils.remove "myArray" 0
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 2
    The variable 'myArray[0]' should eq "b"    
    The variable 'myArray[1]' should eq ""
  End
  
  It 'fails when the index is not present'
    local myArray=("a")
    When call ArrayUtils.remove "myArray" "4"
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 1
    The variable 'myArray[0]' should eq "a"    
  End
  
  It 'fails when the index is not present'
    local myArray=("a")
    When call ArrayUtils.remove "myArray" -1
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 1
    The variable 'myArray[0]' should eq "a"
  End

  It 'fails when the index is not present'
    local myArray=()
    When call ArrayUtils.remove "myArray" 0
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 0
  End
End

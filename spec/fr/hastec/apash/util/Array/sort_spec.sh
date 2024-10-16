Describe 'Array.sort'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.util.Array.sort"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input do not refer to an array'
    When call Array.sort
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input do not refer to an array'
    When call Array.sort ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input do not refer to an array'
    local myVar="test"
    When call Array.sort "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input do not refer to an array'
    local -A myMap=(["foo"]="a")
    When call Array.sort "myMap"
    The output should equal ""
    The status should be failure
  End

  It 'transforms the unset reference to empty array'
    unset myArray
    When call Array.sort "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 0
  End
  
  It 'passes when the reference is an array'
    local myArray=("a" "c" "b")
    When call Array.sort "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 3
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "b"
    The variable 'myArray[2]' should eq "c"
  End

  It 'passes when the reference is an array'
    local myArray=("beta-20" "beta-10" "beta-1")
    When call Array.sort "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 3
    The variable 'myArray[0]' should eq "beta-1"
    The variable 'myArray[1]' should eq "beta-10"
    The variable 'myArray[2]' should eq "beta-20"
  End

  It 'passes when the reference is an array'
    local myArray=("1" "")
    When call Array.sort "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 2
    The variable 'myArray[0]' should eq ""
    The variable 'myArray[1]' should eq "1"
  End

  It 'passes when the reference is an array'
    local myArray=("foo \"bar" "a" "bat man")
    When call Array.sort "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 3
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "bat man"
    The variable 'myArray[2]' should eq "foo \"bar"
  End
End

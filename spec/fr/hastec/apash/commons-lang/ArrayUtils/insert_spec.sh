Describe 'ArrayUtils.insert'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.insert
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF

  It 'fails when the input name does not refer to an array or index is not a number'
    When call ArrayUtils.insert
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to an array or index is not a number'
    When call ArrayUtils.insert "" "" ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array or index is not a number'
    When call ArrayUtils.insert " " "myArray" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array or index is not a number'
    When call ArrayUtils.insert "0" "myArray" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array or index is not a number'
    local myVar="test"
    When call ArrayUtils.insert "0" "myVar" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array or index is not a number'
    local -A myMap=(["foo"]="bar")
    When call ArrayUtils.insert "0" "myMap" "a"
    The output should equal ""
    The status should be failure
  End

  It 'passes when index is a number, reference is an array and values are provided'
    local myArray=()
    When call ArrayUtils.insert "$((APASH_ARRAY_FIRST_INDEX+0))" "myArray" "a"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 1
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
  End

  It 'passes when index is a number, reference is an array and values are provided'
    local myArray=("a")
    When call ArrayUtils.insert "$((APASH_ARRAY_FIRST_INDEX+${#myArray[@]}))" "myArray" "b" ""
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 3
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq ""
  End

  It 'passes when index is a number, reference is an array and values are provided'
    local myArray=("a" "b" "")
    When call ArrayUtils.insert "$((APASH_ARRAY_FIRST_INDEX+2))" "myArray" "c" "d"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 5
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "d"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+4]' should eq ""
  End

  It 'passes when index is a number, reference is an array and values are provided'
    local myArray=("a" "b" "c" "d" "")
    When call ArrayUtils.insert "$((APASH_ARRAY_FIRST_INDEX+1))" "myArray" "foo bar"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 6
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "foo bar"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+4]' should eq "d"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+5]' should eq ""
  End

  It 'fails if bad index is provided or no value to insert'
    local myArray=("a" "foo bar" "b" "c" "d" "")
    When call ArrayUtils.insert "-1" "myArray" "e"
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 6
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "foo bar"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+4]' should eq "d"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+5]' should eq ""
  End

  It 'fails if bad index is provided or no value to insert'
    local myArray=("a" "foo bar" "b" "c" "d" "")
    When call ArrayUtils.insert "$((APASH_ARRAY_FIRST_INDEX+1))" "myArray"
    The output should equal ""
    The status should be failure
    The value "${#myArray[@]}" should eq 6
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "foo bar"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "b"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "c"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+4]' should eq "d"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+5]' should eq ""
  End

  It 'passes even there are some missing values in the middle'
    local myArray=("a" "foo bar" "b" )
    myArray[APASH_ARRAY_FIRST_INDEX+10]="z"
    When call ArrayUtils.insert "$((APASH_ARRAY_FIRST_INDEX+5))" "myArray" "Hello World"
    The output should equal ""
    The status should be success
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "foo bar"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "b"   
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+5]' should eq "Hello World"
    The variable 'myArray[APASH_ARRAY_FIRST_INDEX+11]' should eq "z"
  End

End


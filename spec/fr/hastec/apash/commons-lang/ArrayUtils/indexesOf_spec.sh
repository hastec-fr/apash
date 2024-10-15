Describe 'ArrayUtils.indexesOf_spec'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.indexesOf
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input name does not refere to an array'
    When call ArrayUtils.indexesOf_spec 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.indexesOf_spec "myIndexes" ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.indexesOf_spec "myIndexes" " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local myVar="test"
    When call ArrayUtils.indexesOf_spec "myIndexes" "myVar" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local -A myMap=(["foo"]="bar")
    When call ArrayUtils.indexesOf_spec "myIndexes" "myMap" "a"
    The output should equal ""
    The status should be failure
  End

  It 'passes when input reference is an array'
    local myArray=("a" "b" "" "c" "b")
    When call ArrayUtils.indexesOf_spec "myIndexes" "myArray" "a"
    The output should equal "4"
    The status should be success
    The variable "${#myIndexes[@]}" should eq 1
    The variable 'myIndexes[0]' should eq "0"
  End

  It 'passes when input reference is an array'
    local myArray=("a" "b" "" "c" "b")
    When call ArrayUtils.indexesOf_spec "myIndexes" "myArray" "b"
    The output should equal "4"
    The status should be success
    The variable "${#myIndexes[@]}" should eq 2
    The variable 'myIndexes[0]' should eq "0"
    The variable 'myIndexes[1]' should eq "4"
  End

  It 'passes when input reference is an array'
    local myIndexes=("1" "2")
    local myArray=("a" "b")
    When call ArrayUtils.indexesOf_spec "myIndexes" "myArray" "a" "3"
    The output should equal "4"
    The status should be success
    The variable "${#myIndexes[@]}" should eq 0
  End

  It 'passes when input reference is an array'
    local myIndexes=("1" "2")
    local myArray=("a" "b")
    When call ArrayUtils.indexesOf_spec "myIndexes" "myArray" "a" "-1"
    The output should equal "4"
    The status should be success
    The variable "${#myIndexes[@]}" should eq 1
    The variable 'myIndexes[0]' should eq "0"
  End

End


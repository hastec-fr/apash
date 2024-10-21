Describe 'ArrayUtils.indexesOf'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.indexesOf
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input name does not refere to an array'
    When call ArrayUtils.indexesOf 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.indexesOf "myIndexes" ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.indexesOf "myIndexes" " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local myVar="test"
    When call ArrayUtils.indexesOf "myIndexes" "myVar" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local -A myMap=(["foo"]="bar")
    When call ArrayUtils.indexesOf "myIndexes" "myMap" "a"
    The output should equal ""
    The status should be failure
  End

  It 'passes when input reference is an array'
    local myArray=("a" "b" "" "c" "b")
    When call ArrayUtils.indexesOf "myIndexes" "myArray" "a"
    The output should equal ""
    The status should be success
    The value "${#myIndexes[@]}" should eq 1
    The variable 'myIndexes[$((APASH_ARRAY_FIRST_INDEX+0))]' should eq "$((APASH_ARRAY_FIRST_INDEX+0))"
  End

  It 'passes when input reference is an array'
    local myArray=("a" "b" "" "c" "b")
    When call ArrayUtils.indexesOf "myIndexes" "myArray" "b"
    The output should equal ""
    The status should be success
    The value "${#myIndexes[@]}" should eq 2
    The variable 'myIndexes[$((APASH_ARRAY_FIRST_INDEX+0))]' should eq "$((APASH_ARRAY_FIRST_INDEX+1))"
    The variable 'myIndexes[$((APASH_ARRAY_FIRST_INDEX+1))]' should eq "$((APASH_ARRAY_FIRST_INDEX+4))"
  End

  It 'passes when input reference is an array'
    local myIndexes=("1" "2")
    local myArray=("a" "b")
    When call ArrayUtils.indexesOf "myIndexes" "myArray" "a" "3"
    The output should equal ""
    The status should be success
    The value "${#myIndexes[@]}" should eq 0
  End

  It 'passes when input reference is an array'
    local myIndexes=("1" "2")
    local myArray=("a" "b")
    When call ArrayUtils.indexesOf "myIndexes" "myArray" "a" "-1"
    The output should equal ""
    The status should be success
    The value "${#myIndexes[@]}" should eq 1
    The variable 'myIndexes[$((APASH_ARRAY_FIRST_INDEX+0))]' should eq "$((APASH_ARRAY_FIRST_INDEX+0))"
  End

End


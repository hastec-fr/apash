Describe 'MatrixUtils.set'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.MatrixUtils.create"
    apash.import "fr.hastec.apash.commons-lang.MatrixUtils.set"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi    

  It 'fails when the input name does not refere to a matrix.'
    When call MatrixUtils.set 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to a matrix.'
    When call MatrixUtils.set "" "val" 0 
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    When call MatrixUtils.set " " "val" 0 
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    local myVar="test"
    When call MatrixUtils.set "myVar" "val" 0
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    local -A myMap=(["foo"]="bar")
    When call MatrixUtils.set "myMap" "val" 0
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    local myArray=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    When call MatrixUtils.set "myArray" "val" 0 
    The output should equal ""
    The status should be failure
  End

  It 'passes when reference is a matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 3 3
    When call MatrixUtils.set "myMatrix" "a" 0 0
    The output should equal ""
    The status should be success
    The value "${#myMatrix[@]}" should eq 9
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+0]' should eq "a"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+1]' should eq "2"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+2]' should eq "3"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+3]' should eq "4"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+4]' should eq "5"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+5]' should eq "6"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+6]' should eq "7"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+7]' should eq "8"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+8]' should eq "9"
  End

  It 'passes when reference is a matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 3 3
    MatrixUtils.set "myMatrix" "b" 0 2
    When call MatrixUtils.set "myMatrix" "c" 1 1
    The output should equal ""
    The status should be success
    The value "${#myMatrix[@]}" should eq 9
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+0]' should eq "1"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+1]' should eq "2"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+2]' should eq "b"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+3]' should eq "4"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+4]' should eq "c"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+5]' should eq "6"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+6]' should eq "7"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+7]' should eq "8"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+8]' should eq "9"
  End

  It 'fails when indexes are out of bounds.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 3 3
    When call MatrixUtils.set "myMatrix" "a" 3 0
    The output should equal ""
    The status should be failure
    The value "${#myMatrix[@]}" should eq 9
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+0]' should eq "1"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+1]' should eq "2"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+2]' should eq "3"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+3]' should eq "4"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+4]' should eq "5"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+5]' should eq "6"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+6]' should eq "7"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+7]' should eq "8"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+8]' should eq "9"
  End
End

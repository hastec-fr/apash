Describe 'MatrixUtils.getDim'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.MatrixUtils.create"
    apash.import "fr.hastec.apash.commons-lang.MatrixUtils.getDim"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi    

  It 'fails when the input name does not refere to a matrix.'
    When call MatrixUtils.getDim 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to a matrix.'
    When call MatrixUtils.getDim ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    When call MatrixUtils.getDim " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    local myVar="test"
    When call MatrixUtils.getDim "myVar" 0
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    local -A myMap=(["foo"]="bar")
    When call MatrixUtils.getDim "myMap" 0
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    local myArray=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    When call MatrixUtils.getDim "myArray" 0
    The output should equal ""
    The status should be failure
  End

  It 'passes when reference is a two dimensional matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    local mySubArray=()
    MatrixUtils.create myMatrix 3 3
    When call MatrixUtils.getDim "mySubArray" "myMatrix" 0 1
    The output should equal ""
    The status should be success
    The value "${#mySubArray[@]}" should eq 1
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "2"
  End

  It 'passes when reference is a two dimensional matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    local mySubArray=()
    MatrixUtils.create myMatrix 3 3
    When call MatrixUtils.getDim "mySubArray" "myMatrix" 1 1
    The output should equal ""
    The status should be success
    The value "${#mySubArray[@]}" should eq 1
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "5"
  End
  
  It 'passes when reference is a two dimensional matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    local mySubArray=()
    MatrixUtils.create myMatrix 3 3
    When call MatrixUtils.getDim "mySubArray" "myMatrix" 0
    The output should equal ""
    The status should be success
    The value "${#mySubArray[@]}" should eq 3
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "1"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "2"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "3"
  End

  It 'passes when reference is a two dimensional matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    local mySubArray=()
    MatrixUtils.create myMatrix 3 3
    When call MatrixUtils.getDim "mySubArray" "myMatrix" 1
    The output should equal ""
    The status should be success
    The value "${#mySubArray[@]}" should eq 3
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "4"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "5"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "6"
  End


  It 'passes when reference is a matrix and not providing dimensions.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    local mySubArray=()
    MatrixUtils.create myMatrix 3 3
    When call MatrixUtils.getDim "mySubArray" "myMatrix"
    The output should equal ""
    The status should be success
    The value "${#mySubArray[@]}" should eq 9
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "1"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "2"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "3"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "4"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+4]' should eq "5"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+5]' should eq "6"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+6]' should eq "7"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+7]' should eq "8"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+8]' should eq "9"
  End

  It 'passes when reference is a three dimensional matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    local mySubArray=()
    MatrixUtils.create myMatrix 2 2 2
    When call MatrixUtils.getDim "mySubArray" "myMatrix" 0 1 0
    The output should equal ""
    The status should be success
    The value "${#mySubArray[@]}" should eq 1
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "3"
  End

  It 'passes when reference is a three dimensional matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    local mySubArray=()
    MatrixUtils.create myMatrix 2 2 2
    When call MatrixUtils.getDim "mySubArray" "myMatrix" 1 1
    The output should equal ""
    The status should be success
    The value "${#mySubArray[@]}" should eq 2
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "7"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "8"
  End

  It 'passes when reference is a three dimensional matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    local mySubArray=()
    MatrixUtils.create myMatrix 2 2 2
    When call MatrixUtils.getDim "mySubArray" "myMatrix" 0
    The output should equal ""
    The status should be success
    The value "${#mySubArray[@]}" should eq 4
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+0]' should eq "1"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+1]' should eq "2"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+2]' should eq "3"
    The variable 'mySubArray[APASH_ARRAY_FIRST_INDEX+3]' should eq "4"
  End

End

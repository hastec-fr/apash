Describe 'MatrixUtils.setDim'
  apash.import "fr.hastec.apash.commons-lang.MatrixUtils.create"
  apash.import "fr.hastec.apash.commons-lang.MatrixUtils.setDim"

  It 'fails when the input name does not refere to a matrix.'
    When call MatrixUtils.setDim 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to a matrix.'
    local myRow=(a b c)
    When call MatrixUtils.setDim "" "myRow" 0 
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    local myRow=(a b c)
    When call MatrixUtils.setDim " " "myRow" 0 
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    local myVar="test"
    local myRow=(a b c)
    When call MatrixUtils.setDim "myVar" "myRow" 0
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    local -A myMap=(["foo"]="bar")
    local myRow=(a b c)
    When call MatrixUtils.setDim "myMap" "myRow" 0
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    local myArray=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    local myRow=(a b c)
    When call MatrixUtils.setDim "myArray" "myRow" 0 
    The output should equal ""
    The status should be failure
  End

  It 'passes when reference is a matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    local myRow=(a b c)
    MatrixUtils.create "myMatrix" 3 3
    When call MatrixUtils.setDim "myMatrix" "myRow" 1
    The output should equal ""
    The status should be success
    The value "${#myMatrix[@]}" should eq 9
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+0]' should eq "1"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+1]' should eq "2"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+2]' should eq "3"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+3]' should eq "a"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+4]' should eq "b"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+5]' should eq "c"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+6]' should eq "7"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+7]' should eq "8"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+8]' should eq "9"
  End

  It 'passes when reference is a matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    local myRow=(d e)
    MatrixUtils.create "myMatrix" 3 3
    When call MatrixUtils.setDim "myMatrix" "myRow" 2 1
    The output should equal ""
    The status should be success
    The value "${#myMatrix[@]}" should eq 9
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+0]' should eq "1"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+1]' should eq "2"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+2]' should eq "3"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+3]' should eq "4"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+4]' should eq "5"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+5]' should eq "6"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+6]' should eq "7"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+7]' should eq "d"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+8]' should eq "e"
  End

  It 'passes and keep numbers ove the matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    local myRow=(a b)
    MatrixUtils.create "myMatrix" 2 2 2
    When call MatrixUtils.setDim "myMatrix" "myRow" 1 1 0
    The output should equal ""
    The status should be success
    The value "${#myMatrix[@]}" should eq 9
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+0]' should eq "1"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+1]' should eq "2"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+2]' should eq "3"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+3]' should eq "4"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+4]' should eq "5"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+5]' should eq "6"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+6]' should eq "a"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+7]' should eq "b"
    The variable 'myMatrix[APASH_ARRAY_FIRST_INDEX+8]' should eq "9"
  End

  It 'fails when the number of element to change overflow the dimension.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    local myRow=(a b c)
    MatrixUtils.create "myMatrix" 3 3
    When call MatrixUtils.setDim "myMatrix" "myRow" 2 1
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

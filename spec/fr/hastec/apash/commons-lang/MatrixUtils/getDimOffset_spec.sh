Describe 'MatrixUtils.getDimOffset'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.MatrixUtils.create"
    apash.import "fr.hastec.apash.commons-lang.MatrixUtils.getDimOffset"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi    

  It 'fails when the input name does not refere to a matrix.'
    When call MatrixUtils.getDimOffset 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to a matrix.'
    When call MatrixUtils.getDimOffset "" 0
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    When call MatrixUtils.getDimOffset " " 0
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    local myVar="test"
    When call MatrixUtils.getDimOffset "myVar" 0
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    local -A myMap=(["foo"]="bar")
    When call MatrixUtils.getDimOffset "myMap" 0
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    local myArray=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    When call MatrixUtils.getDimOffset "myArray" 0
    The output should equal ""
    The status should be failure
  End

  It 'passes when reference is a matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 3 3
    When call MatrixUtils.getDimOffset "myMatrix" 0 0
    The output should equal "1"
    The status should be success
  End

  It 'passes when reference is a matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 3 3
    When call MatrixUtils.getDimOffset "myMatrix" 0
    The output should equal "3"
    The status should be success
  End
  
  It 'passes when reference is a matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 3 3
    When call MatrixUtils.getDimOffset "myMatrix" 1
    The output should equal "3"
    The status should be success
  End

  It 'passes when reference is a matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 3 3
    When call MatrixUtils.getDimOffset "myMatrix"
    The output should equal "9"
    The status should be success
  End

  It 'passes when reference is a matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 2 2 2
    When call MatrixUtils.getDimOffset "myMatrix" 0 0 1
    The output should equal "1"
    The status should be success
  End

  It 'passes when reference is a matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 2 2 2
    When call MatrixUtils.getDimOffset "myMatrix" 0 1
    The output should equal "2"
    The status should be success
  End

  It 'passes when reference is a matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 2 2 2
    When call MatrixUtils.getDimOffset "myMatrix" 0
    The output should equal "4"
    The status should be success
  End
  
End

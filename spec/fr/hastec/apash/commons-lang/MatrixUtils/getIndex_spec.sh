Describe 'MatrixUtils.getIndex'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.MatrixUtils.create"
    apash.import "fr.hastec.apash.commons-lang.MatrixUtils.getIndex"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF    

  It 'fails when the input name does not refere to a matrix.'
    When call MatrixUtils.getIndex 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to a matrix.'
    When call MatrixUtils.getIndex "" 0
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    When call MatrixUtils.getIndex " " 0
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    local myVar="test"
    When call MatrixUtils.getIndex "myVar" 0
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    local -A myMap=(["foo"]="bar")
    When call MatrixUtils.getIndex "myMap" 0
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    local myArray=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    When call MatrixUtils.getIndex "myArray" 0
    The output should equal ""
    The status should be failure
  End

  It 'passes when reference is a matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 3 3
    When call MatrixUtils.getIndex "myMatrix" 0 1
    The output should equal "$((APASH_ARRAY_FIRST_INDEX+1))"
    The status should be success
  End

  It 'passes when reference is a matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 3 3
    When call MatrixUtils.getIndex "myMatrix" 1 0
    The output should equal "$((APASH_ARRAY_FIRST_INDEX+3))"
    The status should be success
  End
  
  It 'passes when reference is a matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 3 3
    When call MatrixUtils.getIndex "myMatrix" 1
    The output should equal "$((APASH_ARRAY_FIRST_INDEX+3))"
    The status should be success
  End

  It 'passes when reference is a matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 3 3
    When call MatrixUtils.getIndex "myMatrix" 1 2
    The output should equal "$((APASH_ARRAY_FIRST_INDEX+5))"
    The status should be success
  End

  It 'passes when reference is a matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 3 3
    When call MatrixUtils.getIndex "myMatrix" 2 1
    The output should equal "$((APASH_ARRAY_FIRST_INDEX+7))"
    The status should be success
  End

  It 'fails when indexes are out of bounds.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 3 3
    When call MatrixUtils.getIndex "myMatrix" 1 4
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when indexes are out of bounds.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 3 3
    When call MatrixUtils.getIndex "myMatrix" 3 1
    The output should equal ""
    The status should be failure
  End
End

Describe 'MatrixUtils.get'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.MatrixUtils.create"
    apash.import "fr.hastec.apash.commons-lang.MatrixUtils.get"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF

  It 'fails when the input name does not refere to a matrix.'
    When call MatrixUtils.get 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to a matrix.'
    When call MatrixUtils.get "" 0 
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    When call MatrixUtils.get " " 0 
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    local myVar="test"
    When call MatrixUtils.get "myVar" 0
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    local -A myMap=(["foo"]="bar")
    When call MatrixUtils.get "myMap" 0
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    local myArray=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    When call MatrixUtils.get "myArray" 0 
    The output should equal ""
    The status should be failure
  End

  It 'passes when reference is a matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 3 3
    When call MatrixUtils.get "myMatrix"
    The output should equal "1"
    The status should be success
  End

  It 'passes when reference is a matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 3 3
    When call MatrixUtils.get "myMatrix" 0
    The output should equal "1"
    The status should be success
  End

  It 'passes when reference is a matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 3 3
    When call MatrixUtils.get "myMatrix" 0 0
    The output should equal "1"
    The status should be success
  End

  It 'passes when reference is a three dimensionals matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 2 2 2
    When call MatrixUtils.get "myMatrix"
    The output should equal "1"
    The status should be success
  End

  It 'passes when reference is a three dimensionals matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 2 2 2
    When call MatrixUtils.get "myMatrix" 0
    The output should equal "1"
    The status should be success
  End

  It 'passes when reference is a three dimensionals matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 2 2 2
    When call MatrixUtils.get "myMatrix" 1 1
    The output should equal "7"
    The status should be success
  End

  It 'passes when reference is a three dimensionals matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 2 2 2
    When call MatrixUtils.get "myMatrix" 0 0 0
    The output should equal "1"
    The status should be success
  End

  It 'passes when reference is a three dimensionals matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 2 2 2
    When call MatrixUtils.get "myMatrix" 0 1 0
    The output should equal "3"
    The status should be success
  End

  It 'fails when indexes are out of bounds.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 2 2 2
    When call MatrixUtils.get "myMatrix" 0 2 1
    The output should equal ""
    The status should be failure
  End
End

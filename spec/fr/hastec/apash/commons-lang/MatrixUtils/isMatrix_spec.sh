Describe 'MatrixUtils.isMatrix'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.MatrixUtils.create"
    apash.import "fr.hastec.apash.commons-lang.MatrixUtils.isMatrix"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi    

  It 'fails when the input name does not refere to a matrix.'
    When call MatrixUtils.isMatrix 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to a matrix.'
    When call MatrixUtils.isMatrix ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    When call MatrixUtils.isMatrix " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    local myVar="test"
    When call MatrixUtils.isMatrix "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    local -A myMap=(["foo"]="bar")
    When call MatrixUtils.isMatrix "myMap"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a matrix.'
    local myArray=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    When call MatrixUtils.isMatrix "myArray"
    The output should equal ""
    The status should be failure
  End

  It 'passes when the input name refers to a matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    MatrixUtils.create myMatrix 3 3
    When call MatrixUtils.isMatrix myMatrix
    The output should equal ""
    The status should be success
  End

End

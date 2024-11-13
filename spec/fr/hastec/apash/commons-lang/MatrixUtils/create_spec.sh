Describe 'MatrixUtils.create'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.MatrixUtils.create"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF    

  It 'fails when the input name does not refere to an array or not have enough dimensions.'
    When call MatrixUtils.create 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to an array.'
    When call MatrixUtils.create ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array.'
    When call MatrixUtils.create " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array.'
    local myVar="test"
    When call MatrixUtils.create "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array.'
    local -A myMap=(["foo"]="bar")
    When call MatrixUtils.create "myMap" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs does not have enough dimensions (single dimension).'
    local myArray=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    When call MatrixUtils.create "myArray" 1
    The output should equal ""
    The status should be failure
  End

  It 'fails when one dimension is null.'
    local myArray=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    When call MatrixUtils.create "myArray" 0 9
    The output should equal ""
    The status should be failure
  End

  It 'passes when create a two dimensional matrix.'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    When call MatrixUtils.create myMatrix 3 3
    The output should equal ""
    The status should be success
    The value "${#_apash_matrix_dim_myMatrix[@]}" should eq 2
    The variable '_apash_matrix_dim_myMatrix[APASH_ARRAY_FIRST_INDEX+0]' should eq "3"
    The variable '_apash_matrix_dim_myMatrix[APASH_ARRAY_FIRST_INDEX+1]' should eq "3"
  End

  It 'passes when create a three dimensional matrix even if there are remaining cells'
    local myMatrix=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    When call MatrixUtils.create myMatrix 2 2 2 
    The output should equal ""
    The status should be success
    The value "${#_apash_matrix_dim_myMatrix[@]}" should eq 3
    The variable '_apash_matrix_dim_myMatrix[APASH_ARRAY_FIRST_INDEX+0]' should eq "2"
    The variable '_apash_matrix_dim_myMatrix[APASH_ARRAY_FIRST_INDEX+1]' should eq "2"
    The variable '_apash_matrix_dim_myMatrix[APASH_ARRAY_FIRST_INDEX+2]' should eq "2"
  End

End

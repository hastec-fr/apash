Describe 'ArrayUtils.isArrayIndexValid'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArrayIndexValid
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the inputs do not refere to an array or index not provided'
    When call ArrayUtils.isArrayIndexValid
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the inputs do not refer to an array or index not provided'
    When call ArrayUtils.isArrayIndexValid ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array or index not provided'
    When call ArrayUtils.isArrayIndexValid " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array or index not provided'
    When call ArrayUtils.isArrayIndexValid "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array or index not provided'
    local myArray=("a" "b")
    When call ArrayUtils.isArrayIndexValid "myArray"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array or index not provided'
    local myArray=("a" "b")
    When call ArrayUtils.isArrayIndexValid "myArray" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array or index not provided'
    local -A myMap=(["foo"]="a")
    When call ArrayUtils.isArrayIndexValid "myMap" 0
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array or index not provided'
    When call ArrayUtils.isArrayIndexValid "myArray" 0
    The output should equal ""
    The status should be failure
  End

  It 'passes when the references is an arrays and index exists'
    local myArray=("a" "b" "" "c" "b")
    When call ArrayUtils.isArrayIndexValid "myArray" 1
    The output should equal ""
    The status should be success
  End

  It 'passes when the references is an arrays and index exists'
    local myArray=("a" "" "b")
    When call ArrayUtils.isArrayIndexValid "myArray" 1
    The output should equal ""
    The status should be success
  End

  It 'passes when the references is an arrays and index exists'
    local myArray=("a" "" "b")
    When call ArrayUtils.isArrayIndexValid "myArray" "$((${#myArray}-1))"
    The output should equal ""
    The status should be success
  End

  It 'passes when the references is an arrays with discontinued indexes'
    local myArray=("a" "" "b")
    myArray[10]="z"
    When call ArrayUtils.isArrayIndexValid "myArray" 6
    The output should equal ""
    The status should be success
  End

  It 'fails when the inputs do not refer to an array or index not provided'
    local myArray=("a" "b")
    When call ArrayUtils.isArrayIndexValid "myArray" "3"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array or index not provided'
    local myArray=("a" "b")
    When call ArrayUtils.isArrayIndexValid "myArray" "-1"
    The output should equal ""
    The status should be failure
  End

  It 'fails when index does not exists'
    local myArray=()
    When call ArrayUtils.isArrayIndexValid "myArray" 0
    The output should equal ""
    The status should be failure
  End

End


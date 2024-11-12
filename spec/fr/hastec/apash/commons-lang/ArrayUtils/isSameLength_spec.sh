Describe 'ArrayUtils.isSameLength'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.isSameLength
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input do not refere to an array'
    When call ArrayUtils.isSameLength
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the inputs do not refer to an array'
    When call ArrayUtils.isSameLength "" ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array'
    When call ArrayUtils.isSameLength " " " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array'
    local myVar="test"
    When call ArrayUtils.isSameLength "myVar" "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array'
    When call ArrayUtils.isSameLength "myArray" "myArray"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array'
    local -A myMap=(["foo"]="a")
    When call ArrayUtils.isSameLength "myMap" "myMap"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array'
    local myArray=()
    When call ArrayUtils.isSameLength "myArray" ""
    The output should equal ""
    The status should be failure
  End

  It 'passes when the input arrays have the same length'
    local myArray=()
    When call ArrayUtils.isSameLength "myArray" "myArray"
    The output should equal ""
    The status should be success
  End

  It 'passes when the input arrays have the same length'
    local myArray1=("a")
    local myArray2=("b")
    When call ArrayUtils.isSameLength "myArray1" "myArray2"
    The output should equal ""
    The status should be success
  End

  It 'passes when the input arrays have the same length'
    Skip if "is zsh" global_helper_is_zsh
    local myArray1=("a")
    local myArray2=("a" "b")
    myArray1[10]=z
    When call ArrayUtils.isSameLength "myArray1" "myArray2"
    The output should equal ""
    The status should be success
  End

  It 'fails when the input arrays does not have the same length'
    local myArray1=("a")
    local myArray2=("a" "b")
    When call ArrayUtils.isSameLength "myArray1" "myArray2"
    The output should equal ""
    The status should be failure
  End

End


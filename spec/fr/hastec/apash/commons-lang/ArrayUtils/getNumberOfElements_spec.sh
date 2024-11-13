Describe 'ArrayUtils.getNumberOfElements'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.ArrayUtils.getNumberOfElements"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF

  It 'fails when the input name does not refere to an array'
    When call ArrayUtils.getNumberOfElements
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.getNumberOfElements ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.getNumberOfElements " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local myVar="test"
    When call ArrayUtils.getNumberOfElements "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local -A myMap=(["foo"]="bar")
    When call ArrayUtils.getNumberOfElements "myMap"
    The output should equal ""
    The status should be failure
  End

  It 'passes when input reference is an array'
    local myArray=("a" "b" "" "c")
    When call ArrayUtils.getNumberOfElements "myArray"
    The output should equal "4"
    The status should be success
  End

  It 'passes when input reference is an array'
    local myArray=()
    When call ArrayUtils.getNumberOfElements "myArray"
    The output should equal "0"
    The status should be success
  End

  It 'passes when input reference is an array'
    Skip if "is zsh" global_helper_is_zsh
    local myArray=("a" "b" "" "c")
    myArray[10]=z
    When call ArrayUtils.getNumberOfElements "myArray"
    The output should equal "5"
    The status should be success
  End

End

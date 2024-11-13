Describe 'ArrayUtils.getLength'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.ArrayUtils.getLength"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF

  It 'fails when the input name does not refere to an array'
    When call ArrayUtils.getLength 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.getLength ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    When call ArrayUtils.getLength " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local myVar="test"
    When call ArrayUtils.getLength "myVar" "0"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an array'
    local -A myMap=(["foo"]="bar")
    When call ArrayUtils.getLength "myMap" "0"
    The output should equal ""
    The status should be failure
  End

  It 'passes when input reference is an array'
    local myArray=("a" "b" "" "c")
    When call ArrayUtils.getLength "myArray"
    The output should equal "4"
    The status should be success
  End

  It 'passes when input reference is an array'
    local myArray=()
    When call ArrayUtils.getLength "myArray"
    The output should equal "0"
    The status should be success
  End
  

  It 'passes when input reference is an array'
    Skip if "is zsh" global_helper_is_zsh
    local myArray=("a" "b" "" "c")
    myArray[9223372036854775806]=z
    When call ArrayUtils.getLength "myArray"
    The output should equal "9223372036854775807"
    The status should be success
  End

  It 'passes when input reference is an array'
    Skip if "is zsh" global_helper_is_zsh
    local myArray=("a" "b" "" "c")
    myArray[9223372036854775807]=z
    When call ArrayUtils.getLength "myArray"
    The output should equal ""
    The status should be failure
  End
  
  It 'passes when input reference is an array'
    local myArray=("a" "b" "" "c")
    myArray[10]=z
    When call ArrayUtils.getLength "myArray"
    The output should equal "$((11-APASH_ARRAY_FIRST_INDEX))"
    The status should be success
  End
End

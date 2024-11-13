Describe 'MapUtils.containsKey'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.MapUtils.containsKey"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF

  It 'fails when the input name does not refer to a map'
    When call MapUtils.containsKey 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to a map'
    When call MapUtils.containsKey "" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a map'
    When call MapUtils.containsKey " " "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a map'
    When call MapUtils.containsKey "myMap" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a map'
    local myVar="a"
    When call MapUtils.containsKey "myVar" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a map'
    local -a myArray=("a")
    When call MapUtils.containsKey "myArray" "a"
    The output should equal ""
    The status should be failure
  End

  # @todo: Cannot assign directly index in zsh, to be checked with shellspec support.
  # It 'fails when the input name does not refer to a map'
  #   Skip if "is zsh" global_helper_is_zsh
  #   local -a myArray=([0]="bar")
  #   When call MapUtils.containsKey "myArray" "a"
  #   The output should equal ""
  #   The status should be failure
  # End

  It 'passes when references is a map and value is present'
    local -A myMap=(["foo"]="bar" ["key"]="value")
    When call MapUtils.containsKey "myMap" "foo"
    The output should equal ""
    The status should be success
  End

  It 'passes when references is a map and value is present'
    local -A myMap=(["foo"]="bar" ["key"]="value")
    When call MapUtils.containsKey "myMap" "key"
    The output should equal ""
    The status should be success
  End

  It 'fails when references is a map but value is not present'
    local -A myMap=(["foo"]="bar" ["key"]="value")
    When call MapUtils.containsKey "myMap" "wrong"
    The output should equal ""
    The status should be failure
  End
End

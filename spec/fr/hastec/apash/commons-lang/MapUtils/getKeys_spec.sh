Describe 'MapUtils.getKeys'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.MapUtils.getKeys"
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.contains
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF

  It 'fails when the input name does not refer to a map'
    local -a myArray=()
    When call MapUtils.getKeys "myArray" myMap
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a map'
    local -a myArray=()
    When call MapUtils.getKeys "myArray" " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a map'
    local -a myArray=()
    When call MapUtils.getKeys "myArray" "myMap"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a map'
    local -a myArray=()
    local myVar="a"
    When call MapUtils.getKeys "myArray" "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a map'
    local -a myArray=()
    local -a myMap=("a")
    When call MapUtils.getKeys "myArray" "myMap"
    The output should equal ""
    The status should be failure
  End

  It 'passes when references is a map with simple keys'
    local -a myArray=()
    local -A myMap=(["foo"]="bar" ["key"]="value")
    When call MapUtils.getKeys "myArray" "myMap"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 2
    Assert ArrayUtils.contains myArray "foo"
    Assert ArrayUtils.contains myArray "key"
  End

  It 'passes when references is a map with splitted keys'
    local -a myArray=()
    local -A myMap=(["bat man"]="bar" ["key"]="value")
    When call MapUtils.getKeys "myArray" "myMap"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 2
    Assert ArrayUtils.contains myArray "bat man"
    Assert ArrayUtils.contains myArray "key"
  End

  It 'passes when references is an empty map'
    local -a myArray=()
    local -A myMap=()
    When call MapUtils.getKeys "myArray" "myMap"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 0
  End

  It 'passes when output array is not empty'
    local -a myArray=("a" "b")
    local -A myMap=(["foo"]="bar" ["key"]="value")
    When call MapUtils.getKeys "myArray" "myMap"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 2
    Assert ArrayUtils.contains myArray "foo"
    Assert ArrayUtils.contains myArray "key"
  End
End

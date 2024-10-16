Describe 'ArrayUtils.isEmpty'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.isEmpty
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input do not refer to an array'
    When call ArrayUtils.isEmpty
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input do not refer to an array'
    When call ArrayUtils.isEmpty ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input do not refer to an array'
    When call ArrayUtils.isEmpty " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input do not refer to an array'
    When call ArrayUtils.isEmpty "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input do not refer to an array'
    local myVar=""
    When call ArrayUtils.isEmpty "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input do not refer to an array'
    local -A myMap=()
    When call ArrayUtils.isEmpty "myMap"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input array has elements'
    local myArray=("a")
    When call ArrayUtils.isEmpty "myArray"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input array has elements'
    local myArray=("")
    When call ArrayUtils.isEmpty "myArray"
    The output should equal ""
    The status should be failure
  End

  It 'passes when the input array does not have elements'
    local myArray=()
    When call ArrayUtils.isEmpty "myArray"
    The output should equal ""
    The status should be success
  End

End

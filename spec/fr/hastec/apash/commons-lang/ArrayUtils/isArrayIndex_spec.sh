Describe 'ArrayUtils.isArrayIndex'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArrayIndex
    apash.import fr.hastec.apash.lang.Long
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the inputs is not a positive long number'
    When call ArrayUtils.isArrayIndex
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refere an array'
    When call ArrayUtils.isArrayIndex ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refere an array'
    When call ArrayUtils.isArrayIndex " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refere an array'
    When call ArrayUtils.isArrayIndex "a"
    The output should equal ""
    The status should be failure
  End

  It 'passes when the input is a positive long number'
    When call ArrayUtils.isArrayIndex "$APASH_ARRAY_FIRST_INDEX"
    The output should equal ""
    The status should be success
  End

  It 'passes when the input is a positive long number'
    When call ArrayUtils.isArrayIndex "$Long_MAX_VALUE"
    The output should equal ""
    The status should be success
  End

  It 'fails when index is out of range'
    When call ArrayUtils.isArrayIndex 9223372036854775808
    The output should equal ""
    The status should be failure
  End

  It 'fails when index is out of range'
    When call ArrayUtils.isArrayIndex $((APASH_ARRAY_FIRST_INDEX-1))
    The output should equal ""
    The status should be failure
  End

  It 'fails when index is out of range'
    When call ArrayUtils.isArrayIndex 1.2
    The output should equal ""
    The status should be failure
  End
End


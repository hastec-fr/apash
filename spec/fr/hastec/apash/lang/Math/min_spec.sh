Describe 'Math.min'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.lang.Math.min"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'returns empty value when at least one input is not parsable'
    When call Math.min
    The output should equal ""
    The status should be failure
  End
  
  It 'returns empty value when at least one input is not parsable'
    When call Math.min ""
    The output should equal ""
    The status should be failure
  End

  It 'returns empty value when at least one input is not parsable'
    When call Math.min "a"
    The output should equal ""
    The status should be failure
  End

  It 'returns empty value when at least one input is not parsable'
    When call Math.min "0" "a"
    The output should equal ""
    The status should be failure
  End

  It 'returns the greater value of two numbers'
    When call Math.min "0" "1"
    The output should equal "0"
    The status should be success
  End

  It 'returns the greater value of two numbers'
    When call Math.min "2" "103"
    The output should equal "2"
    The status should be success
  End
  
  It 'returns the greater value of two numbers'
    When call Math.min "1" "-1"
    The output should equal "-1"
    The status should be success
  End

  It 'returns the greater value of two numbers'
    When call Math.min "-2" "-3"
    The output should equal "-3"
    The status should be success
  End

  It 'returns the greater value of two numbers'
    When call Math.min "0.123" ".099"
    The output should equal ".099"
    The status should be success
  End

  It 'returns the greater value of two numbers'
    When call Math.min "-.123" "0.123"
    The output should equal "-.123"
    The status should be success
  End

  It 'returns the greater value of two numbers'
    When call Math.min "0.123" ".123"
    The output should equal "0.123"
    The status should be success
  End

  It 'returns the greater value of two numbers'
    When call Math.min "000" "0" 
    The output should equal "000"
    The status should be success
  End

End

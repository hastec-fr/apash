Describe 'StringUtils.substring'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.StringUtils.substring"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF    

  It 'returns empty when no arguments'
    When call StringUtils.substring
    The output should equal ""
    The status should be success
  End

  It 'returns empty when the input argument is empty'
    When call StringUtils.substring ""
    The output should equal ""
    The status should be success
  End

  It 'returns empty when the input argument is empty'
    When call StringUtils.substring "" 0
    The output should equal ""
    The status should be success
  End

  It 'returns empty when the input argument is empty'
    When call StringUtils.substring "" 0 1
    The output should equal ""
    The status should be success
  End

  It 'returns correct substring for nominal cases'
    When call StringUtils.substring "abc" 0 2
    The output should equal "ab"
    The status should be success
  End

  It 'returns correct substring for nominal cases'
    When call StringUtils.substring "abc" 0 -1
    The output should equal "ab"
    The status should be success
  End

  It 'returns correct substring for nominal cases'
    When call StringUtils.substring "abc" 2 4
    The output should equal "c"
    The status should be success
  End

  It 'returns correct substring for nominal cases'
    When call StringUtils.substring "abc" -2 -1
    The output should equal "b"
    The status should be success
  End

  It 'returns correct substring for nominal cases'
    When call StringUtils.substring "abc" -4 2
    The output should equal "ab"
    The status should be success
  End

  It 'returns correct substring for nominal cases'
    When call StringUtils.substring "abc" 2 6
    The output should equal "c"
    The status should be success
  End

  It 'returns empty when the indexes are equal'
    When call StringUtils.substring "abc" 2 2
    The output should equal ""
    The status should be success
  End

  It 'returns empty when start is greater than end'
    When call StringUtils.substring "abc" 2 0
    The output should equal ""
    The status should be success
  End

  It 'returns empty when start is greater than string'
    When call StringUtils.substring "abc" 4 6
    The output should equal ""
    The status should be success
  End

  It 'returns empty when end is less than 0'
    When call StringUtils.substring "abc" -4 -6
    The output should equal ""
    The status should be success
  End

End

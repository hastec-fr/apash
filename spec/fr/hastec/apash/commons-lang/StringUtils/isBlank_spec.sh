Describe 'StringUtils.isBlank'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.StringUtils.isBlank"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi
  APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF    

  It 'passes without argument'
    When call StringUtils.isBlank
    The output should equal ""
    The status should be success
  End

  It 'passes with an empty argument'
    When call StringUtils.isBlank ""
    The output should equal ""
    The status should be success
  End

  It 'passes with a blank argument'
    When call StringUtils.isBlank " "
    The output should equal ""
    The status should be success
  End

  It 'passes with multiple spaces argument'
    When call StringUtils.isBlank "    "
    The output should equal ""
    The status should be success
  End

  It 'passes with a tab argument'
    When call StringUtils.isBlank "	"
    The output should equal ""
    The status should be success
  End

  It 'fails with a non empty argument'
    When call StringUtils.isBlank "Hello World"
    The output should equal ""
    The status should be failure
  End

  It 'fails with a non empty argument starting and finising by spaces'
    When call StringUtils.isBlank "   Hello World   "
    The output should equal ""
    The status should be failure
  End

End

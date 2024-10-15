Describe 'StringUtils.isEmpty'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.StringUtils.isEmpty"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi    

  It 'passes without argument'
    When call StringUtils.isEmpty
    The output should equal ""
    The status should be success
  End

  It 'passes with an empty argument'
    When call StringUtils.isEmpty ""
    The output should equal ""
    The status should be success
  End

  It 'fails with a blank argument'
    When call StringUtils.isEmpty " "
    The output should equal ""
    The status should be failure
  End

  It 'fails with multiple spaces argument'
    When call StringUtils.isEmpty "    "
    The output should equal ""
    The status should be failure
  End

  It 'fails with a tab argument'
    When call StringUtils.isEmpty "	"
    The output should equal ""
    The status should be failure
  End

  It 'fails with a non empty argument'
    When call StringUtils.isEmpty "Hello World"
    The output should equal ""
    The status should be failure
  End

  It 'fails with a non empty argument starting and finising by spaces'
    When call StringUtils.isEmpty "   Hello World   "
    The output should equal ""
    The status should be failure
  End

End

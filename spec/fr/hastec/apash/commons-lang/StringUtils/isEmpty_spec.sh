Describe 'StringUtils.isEmpty'
  apash.import "fr.hastec.apash.commons-lang.StringUtils.isEmpty"

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

Describe 'StringUtils.isBlank'
  apash.import "fr.hastec.apash.commons-lang.StringUtils.isBlank"

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

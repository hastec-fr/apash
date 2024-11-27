Describe 'StringUtils.isAnyEmpty'
  apash.import "fr.hastec.apash.commons-lang.StringUtils.isAnyEmpty"

  It 'passes without argument'
    When call StringUtils.isAnyEmpty
    The output should equal ""
    The status should be success
  End

  It 'passes with at least an empty argument'
    When call StringUtils.isAnyEmpty ""
    The output should equal ""
    The status should be success
  End

  It 'passes with at least an empty argument'
    When call StringUtils.isAnyEmpty "" "foo"
    The output should equal ""
    The status should be success
  End

  It 'passes with at least an empty argument'
    When call StringUtils.isAnyEmpty "bob" ""
    The output should equal ""
    The status should be success
  End

  It 'passes with at least an empty argument'
    When call StringUtils.isAnyEmpty "  bob  " ""
    The output should equal ""
    The status should be success
  End

  It 'fails with only non empty argument'
    When call StringUtils.isAnyEmpty " "
    The output should equal ""
    The status should be failure
  End

  It 'fails with only non empty argument'
    When call StringUtils.isAnyEmpty "	"
    The output should equal ""
    The status should be failure
  End

  It 'fails with only non empty argument'
    When call StringUtils.isAnyEmpty "Hello World"
    The output should equal ""
    The status should be failure
  End

  It 'fails with only non empty argument'
    When call StringUtils.isAnyEmpty "   Hello World   "
    The output should equal ""
    The status should be failure
  End

  It 'fails with only non empty argument'
    When call StringUtils.isAnyEmpty " " "bar"
    The output should equal ""
    The status should be failure
  End

  It 'fails with only non empty argument'
    When call StringUtils.isAnyEmpty "foo" "bar"
    The output should equal ""
    The status should be failure
  End
End

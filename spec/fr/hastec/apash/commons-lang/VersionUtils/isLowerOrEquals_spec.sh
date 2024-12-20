Describe 'VersionUtils.isLowerOrEquals'
  apash.import "fr.hastec.apash.commons-lang.VersionUtils.isLowerOrEquals"

  # @todo: add test for empty strings
  It 'passes when the first version is equal to the second one'
    When call VersionUtils.isLowerOrEquals "1.2.0" "1.2.0"
    The output should equal ""
    The status should be success
  End

  It 'passes when the first version is less than the second one'
    When call VersionUtils.isLowerOrEquals "1.2.1" "1.10.0"
    The output should equal ""
    The status should be success
  End

  It 'passes when the first version is less than the second one even with pre-release'
    When call VersionUtils.isLowerOrEquals "1.2.0-alpha2" "1.2.0-beta1"
    The output should equal ""
    The status should be success
  End

  It 'fails when the first version is greater than the second one'
    When call VersionUtils.isLowerOrEquals "1.10.1" "1.2.0"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the first version is greater than the second one'
    When call VersionUtils.isLowerOrEquals "1.2.0-final" "1.2.0-alpha2"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the first version is greater than the second one'
    When call VersionUtils.isLowerOrEquals "1.2.0" "1.2.0-alpha2"
    The output should equal ""
    The status should be failure
  End

  It 'passes when the first version is lower than the second one according to semver'
    When call VersionUtils.isLowerOrEquals "1.0.0-rc.1" "1.0.0"
    The output should equal ""
    The status should be success
  End

  It 'passes when the first version is lower than the second one according to semver'
    When call VersionUtils.isLowerOrEquals "1.0.0-beta.11" "1.0.0-rc.1"
    The output should equal ""
    The status should be success
  End

  It 'passes when the first version is lower than the second one according to semver'
    When call VersionUtils.isLowerOrEquals "1.0.0-beta.2" "1.0.0-beta.11"
    The output should equal ""
    The status should be success
  End

  It 'passes when the first version is lower than the second one according to semver'
    When call VersionUtils.isLowerOrEquals "1.0.0-beta" "1.0.0-beta.2"
    The output should equal ""
    The status should be success
  End

  It 'passes when the first version is lower than the second one according to semver'
    When call VersionUtils.isLowerOrEquals "1.0.0-alpha.beta" "1.0.0-beta"
    The output should equal ""
    The status should be success
  End

  It 'passes when the first version is lower than the second one according to semver'
    When call VersionUtils.isLowerOrEquals "1.0.0-alpha.1" "1.0.0-alpha.beta"
    The output should equal ""
    The status should be success
  End

  It 'passes when the first version is lower than the second one according to semver'
    When call VersionUtils.isLowerOrEquals "1.0.0-alpha" "1.0.0-alpha.1"
    The output should equal ""
    The status should be success
  End
End

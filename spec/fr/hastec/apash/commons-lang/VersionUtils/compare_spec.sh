Describe 'VersionUtils.compare'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.VersionUtils.compare"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'passes when the inputs are empties'
    When call VersionUtils.compare 
    The output should equal "0"
    The status should be success
  End
  
  It 'passes when the inputs are empties'
    When call VersionUtils.compare "" ""
    The output should equal "0"
    The status should be success
  End

  It 'passes when inputs are not the same kind (alphanumeric sort applied)'
    When call VersionUtils.compare "a" "0"
    The output should equal "1"
    The status should be success
  End

  It 'passes when inputs are in same type'
    When call VersionUtils.compare "1.2" "0"
    The output should equal "1"
    The status should be success
  End

  It 'returns 0 when both version are equals'
    When call VersionUtils.compare "1.2.0" "1.2.0"
    The output should equal "0"
    The status should be success
  End

  It 'returns 0 when both version are equals'
    When call VersionUtils.compare "1.2.0-alpha.x.y+001" "1.2.0-alpha.x.y+001"
    The output should equal "0"
    The status should be success
  End
 
  It 'returns -1 when the first version is lower than the second'
    When call VersionUtils.compare "1.1.0" "1.2.0"
    The output should equal "-1"
    The status should be success
  End

  # Check  1.0.0-alpha < 1.0.0-alpha.1 < 1.0.0-alpha.beta < 1.0.0-beta < 1.0.0-beta.2 < 1.0.0-beta.11 < 1.0.0-rc.1 < 1.0.0.
  It 'returns -1 when the first version is lower than the second'
    When call VersionUtils.compare "1.0.0-rc" "1.1.0"
    The output should equal "-1"
    The status should be success
  End

  It 'returns -1 when the first version is lower than the second'
    When call VersionUtils.compare "1.0.0-beta.11" "1.0.0-rc.1"
    The output should equal "-1"
    The status should be success
  End

  It 'returns -1 when the first version is lower than the second'
    When call VersionUtils.compare "1.0.0-beta.2" "1.0.0-beta.11"
    The output should equal "-1"
    The status should be success
  End

  It 'returns -1 when the first version is lower than the second'
    When call VersionUtils.compare "1.0.0-beta" "1.0.0-beta.2"
    The output should equal "-1"
    The status should be success
  End

  It 'returns -1 when the first version is lower than the second'
    When call VersionUtils.compare "1.0.0-alpha.beta" "1.0.0-beta"
    The output should equal "-1"
    The status should be success
  End

  It 'returns -1 when the first version is lower than the second'
    When call VersionUtils.compare "1.0.0-alpha.1" "1.0.0-alpha.beta"
    The output should equal "-1"
    The status should be success
  End

  It 'returns -1 when the first version is lower than the second'
    When call VersionUtils.compare "1.0.0-alpha" "1.0.0-alpha.1"
    The output should equal "-1"
    The status should be success
  End

  # Reverse check
  It 'returns 1 when the first version is greater than the second'
    When call VersionUtils.compare "1.1.0" "1.0.0-rc" 
    The output should equal "1"
    The status should be success
  End

  It 'returns -1 when the first version is lower than the second'
    When call VersionUtils.compare "1.0.0-rc.1" "1.0.0-beta.11"
    The output should equal "1"
    The status should be success
  End

  It 'returns -1 when the first version is lower than the second'
    When call VersionUtils.compare "1.0.0-beta.11" "1.0.0-beta.2"
    The output should equal "1"
    The status should be success
  End

  It 'returns -1 when the first version is lower than the second'
    When call VersionUtils.compare "1.0.0-beta.2" "1.0.0-beta"
    The output should equal "1"
    The status should be success
  End

  It 'returns -1 when the first version is lower than the second'
    When call VersionUtils.compare "1.0.0-beta" "1.0.0-alpha.beta"
    The output should equal "1"
    The status should be success
  End

  It 'returns -1 when the first version is lower than the second'
    When call VersionUtils.compare "1.0.0-alpha.beta" "1.0.0-alpha.1"
    The output should equal "1"
    The status should be success
  End

  It 'returns -1 when the first version is lower than the second'
    When call VersionUtils.compare "1.0.0-alpha.1" "1.0.0-alpha"
    The output should equal "1"
    The status should be success
  End

End

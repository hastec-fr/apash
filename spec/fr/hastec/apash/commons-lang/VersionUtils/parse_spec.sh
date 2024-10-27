Describe 'VersionUtils.parse'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.VersionUtils.parse"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi    

  It 'fails when version does not respect semver'
    local -A myMap=()
    When call VersionUtils.parse myMap "v1.2.0"
    The output should equal ""
    The status should be failure
  End

  It 'passes when the version is a valid semver'
    local -A myMap=()
    When call VersionUtils.parse myMap "1.2.0"
    The output should equal ""
    The status should be success
    The value "${#myMap[@]}" should eq 5
    The variable 'myMap[major]' should eq "1"
    The variable 'myMap[minor]' should eq "2"
    The variable 'myMap[patch]' should eq "0"
    The variable 'myMap[prerelease]' should eq ""
    The variable 'myMap[build]' should eq ""
  End

  It 'passes when the version is a valid semver'
    local -A myMap=()
    When call VersionUtils.parse myMap "1.2.0-alpha"
    The output should equal ""
    The status should be success
    The value "${#myMap[@]}" should eq 5
    The variable 'myMap[major]' should eq "1"
    The variable 'myMap[minor]' should eq "2"
    The variable 'myMap[patch]' should eq "0"
    The variable 'myMap[prerelease]' should eq "alpha"
    The variable 'myMap[build]' should eq ""
  End

  It 'passes when the version is a valid semver'
    local -A myMap=()
    When call VersionUtils.parse myMap "1.2.0-alpha.11"
    The output should equal ""
    The status should be success
    The value "${#myMap[@]}" should eq 5
    The variable 'myMap[major]' should eq "1"
    The variable 'myMap[minor]' should eq "2"
    The variable 'myMap[patch]' should eq "0"
    The variable 'myMap[prerelease]' should eq "alpha.11"
    The variable 'myMap[build]' should eq ""
  End

  It 'passes when the version is a valid semver'
    local -A myMap=()
    When call VersionUtils.parse myMap "1.2.0-alpha.11+001"
    The output should equal ""
    The status should be success
    The value "${#myMap[@]}" should eq 5
    The variable 'myMap[major]' should eq "1"
    The variable 'myMap[minor]' should eq "2"
    The variable 'myMap[patch]' should eq "0"
    The variable 'myMap[prerelease]' should eq "alpha.11"
    The variable 'myMap[build]' should eq "001"
  End
End

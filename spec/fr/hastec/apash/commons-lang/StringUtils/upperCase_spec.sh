Describe 'StringUtils.upperCase'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.StringUtils.upperCase"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi    

  It 'returns the converted string to upper cases'
    When call StringUtils.upperCase "abc"
    The output should equal "ABC"
    The status should be success
  End

  It 'returns the converted string to upper cases'
    When call StringUtils.upperCase "aBc"
    The output should equal "ABC"
    The status should be success
  End

  It 'returns the converted string to upper cases'
    When call StringUtils.upperCase "a123b"
    The output should equal "A123B"
    The status should be success
  End

  It 'returns the converted string to upper cases'
    When call StringUtils.upperCase "ABC"
    The output should equal "ABC"
    The status should be success
  End

  It 'returns the converted string to upper cases'
    When call StringUtils.upperCase "crème brûlée"
    The output should equal "CRÈME BRÛLÉE"
    The status should be success
  End
  
End

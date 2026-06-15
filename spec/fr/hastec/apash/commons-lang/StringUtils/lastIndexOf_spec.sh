Describe 'StringUtils.lastIndexOf'
  apash.import "fr.hastec.apash.commons-lang.StringUtils.lastIndexOf"

  It 'returns 0 without arguments'
    When call StringUtils.lastIndexOf
    The output should equal "0"
    The status should be success
  End

  It 'returns 0 with empty arguments'
    When call StringUtils.lastIndexOf "" ""
    The output should equal "0"
    The status should be success
  End

  It 'returns -1 when string to check is empty and search is not empty'
    When call StringUtils.lastIndexOf "" "*"
    The output should equal "-1"
    The status should be success
  End
  
  It 'returns 8 when string to check is not empty and search is empty'
    When call StringUtils.lastIndexOf "aabaabaa" ""
    The output should equal "8"
    The status should be success
  End

  It 'returns 5 when third character is matching'
    When call StringUtils.lastIndexOf "aabaabaa" "b"
    The output should equal "5"
    The status should be success
  End

  It 'returns 4 when first sequence character is matching at second letter'
    When call StringUtils.lastIndexOf "aabaabaa" "ab"
    The output should equal "4"
    The status should be success
  End

  It 'returns -1 when research is not matching in the string'
    When call StringUtils.lastIndexOf "aabaabaa" "mn"
    The output should equal "-1"
    The status should be success
  End

  It 'returns 0 when research is completly matching the string'
    When call StringUtils.lastIndexOf "aabaabaa" "aabaabaa"
    The output should equal "0"
    The status should be success
  End
End

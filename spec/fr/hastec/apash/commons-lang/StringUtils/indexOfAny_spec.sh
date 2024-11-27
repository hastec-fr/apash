Describe 'StringUtils.indexOfAny'
  apash.import "fr.hastec.apash.commons-lang.StringUtils.indexOfAny"

  It 'returns -1 without arguments'
    When call StringUtils.indexOfAny
    The output should equal "-1"
    The status should be success
  End

  It 'returns -1 when no research provided'
    When call StringUtils.indexOfAny "abcd"
    The output should equal "-1"
    The status should be success
  End

  It 'returns index when research match in the string'
    local myArray=( "ab" "cd" )
    When call StringUtils.indexOfAny "zzabyycdxx" myArray
    The output should equal "2"
    The status should be success
  End
  
  It 'returns the minimum index when research match in the string'
    local myArray=( "cd" "ab" )
    When call StringUtils.indexOfAny "zzabyycdxx" myArray
    The output should equal "2"
    The status should be success
  End

  It 'returns -1 when no research match in the string'
    local myArray=( "mn" "op" )
    When call StringUtils.indexOfAny "zzabyycdxx" myArray
    The output should equal "-1"
    The status should be success
  End

  It 'returns index on longer researh'
    local myArray=( "zab" "aby" )
    When call StringUtils.indexOfAny "zzabyycdxx" myArray
    The output should equal "1"
    The status should be success
  End

  It 'returns 0 when research is empty'
    local myArray=( "" )
    When call StringUtils.indexOfAny "zzabyycdxx" myArray
    The output should equal "0"
    The status should be success
  End

  It 'returns 0 when string and research are empty'
    local myArray=( "" )
    When call StringUtils.indexOfAny "" myArray
    The output should equal "0"
    The status should be success
  End

  It 'returns -1 when string is empty but not the research'
    local myArray=( "a" )
    When call StringUtils.indexOfAny "" myArray
    The output should equal "-1"
    The status should be success
  End
End

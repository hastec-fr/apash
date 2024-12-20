Describe 'MapUtils.isMap'
  apash.import "fr.hastec.apash.commons-lang.MapUtils.isMap"

  It 'fails when the input name does not refer to a map'
    When call MapUtils.isMap 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to a map'
    When call MapUtils.isMap "" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a map'
    When call MapUtils.isMap " " "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a map'
    When call MapUtils.isMap "myMap" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a map'
    local myVar="a"
    When call MapUtils.isMap "myVar" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to a map'
    local -a myArray=("a")
    When call MapUtils.isMap "myArray" "a"
    The output should equal ""
    The status should be failure
  End

  # @todo: Cannot assign directly index in zsh, to be checked with shellspec support.
  # It 'fails when the input name does not refer to a map'
  #   local -a myArray=([0]="bar")
  #   When call MapUtils.isMap "myArray" "a"
  #   The output should equal ""
  #   The status should be failure
  # End

  It 'passes when references is a map'
    Skip if "old bash" global_helper_is_shell_version_lower "bash" "4.3"
    local -A myMap
    When call MapUtils.isMap "myMap"
    The output should equal ""
    The status should be success
  End

  It 'passes when references is a map'
    local -A myMap=()
    When call MapUtils.isMap "myMap"
    The output should equal ""
    The status should be success
  End

  It 'passes when references is a map'
    local -A myMap=(["Hello"]="World")
    When call MapUtils.isMap "myMap"
    The output should equal ""
    The status should be success
  End

  It 'passes when references is a map'
    declare -A myMap=(["foo"]="bar" ["key"]="value")
    When call MapUtils.isMap "myMap"
    The output should equal ""
    The status should be success
  End
End

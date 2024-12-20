Describe 'ArrayUtils.isArray'
  apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArray

  It 'fails when the input name does not refere an array'
    When call ArrayUtils.isArray
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refere an array'
    When call ArrayUtils.isArray ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refere an array'
    When call ArrayUtils.isArray "myArray"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refere an array'
    local myVar="test"
    When call ArrayUtils.isArray "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refere an array'
    local -A myMap=(["foo"]="bar")
    When call ArrayUtils.isArray "myMap"
    The output should equal ""
    The status should be failure
  End

  It 'passes when the input argument is an array'
    local myArray=()
    When call ArrayUtils.isArray "myArray"
    The output should equal ""
    The status should be success
  End

  It 'passes when the input argument is an array'
    local myArray=("1" "2")
    When call ArrayUtils.isArray "myArray"
    The output should equal ""
    The status should be success
  End

  # Syntax not valid for bash 4.3
  It 'passes when the input argument is an array'
    Skip if "old bash" global_helper_is_shell_version_lower "bash" "4.3"
    declare -a myArray
    When call ArrayUtils.isArray "myArray"
    The output should equal ""
    The status should be success
  End

  It 'passes when the input argument is an array'
    Skip if "old bash" global_helper_is_shell_version_lower "bash" "4.3"
    local -a myArray
    When call ArrayUtils.isArray "myArray"
    The output should equal ""
    The status should be success
  End

End


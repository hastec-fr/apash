Describe 'ArrayUtils.isSorted'
  apash.import fr.hastec.apash.commons-lang.ArrayUtils.isSorted

  It 'fails when the input do not refere to an array'
    When call ArrayUtils.isSorted
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the inputs do not refer to an array'
    When call ArrayUtils.isSorted ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array'
    When call ArrayUtils.isSorted " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array'
    local myVar="test"
    When call ArrayUtils.isSorted "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array'
    When call ArrayUtils.isSorted "myArray"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the inputs do not refer to an array'
    local -A myMap=(["foo"]="a")
    When call ArrayUtils.isSorted "myMap"
    The output should equal ""
    The status should be failure
  End
 
  It 'passes when the input array is sorted in natural order'
    local myArray=()
    When call ArrayUtils.isSorted "myArray"
    The output should equal ""
    The status should be success
  End

  It 'passes when the input array is sorted in natural order'
    local myArray=("a" "b" "c")
    When call ArrayUtils.isSorted "myArray"
    The output should equal ""
    The status should be success
  End

  It 'passes when the input array is sorted in natural order'
    local myArray=("beta-1" "beta-10" "beta-20")
    When call ArrayUtils.isSorted "myArray"
    The output should equal ""
    The status should be success
  End

  It 'passes when the input array is sorted in natural order'
    local myArray=("1" "a")
    When call ArrayUtils.isSorted "myArray"
    The output should equal ""
    The status should be success
  End

  It 'passes when the input array is sorted in natural order'
    local myArray=("" "1")
    When call ArrayUtils.isSorted "myArray"
    The output should equal ""
    The status should be success
  End

  It 'fails when the input array is not sorted in natural order'
    local myArray=("a" "c" "b")
    When call ArrayUtils.isSorted "myArray"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input array is not sorted in natural order'
    local myArray=("a" "b" "")
    When call ArrayUtils.isSorted "myArray"
    The output should equal ""
    The status should be failure
  End

End


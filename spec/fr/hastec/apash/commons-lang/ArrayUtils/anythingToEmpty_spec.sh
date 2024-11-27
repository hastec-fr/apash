Describe 'ArrayUtils.anythingToEmpty'
  apash.import "fr.hastec.apash.commons-lang.ArrayUtils.anythingToEmpty"

  It 'fails when the input name is not a valid variable name'
    When call ArrayUtils.anythingToEmpty 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name is not a valid variable name'
    When call ArrayUtils.anythingToEmpty ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid variable name'
    When call ArrayUtils.anythingToEmpty " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid variable name'
    When call ArrayUtils.anythingToEmpty "my Array"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid variable name'
    When call ArrayUtils.anythingToEmpty "1myArray"
    The output should equal ""
    The status should be failure
  End

  It 'overrides old reference if the name is a valid variable'
    local myVar=test
    When call ArrayUtils.anythingToEmpty "myVar"
    The output should equal ""
    The status should be success
    The value "${#myVar[@]}" should eq 0
  End

  It 'overrides old reference if the name is a valid variable'
    local -A myMap=(["foo"]="bar")
    When call ArrayUtils.anythingToEmpty "myMap"
    The output should equal ""
    The status should be success
    The value "${#myMap[@]}" should eq 0
  End

  It 'passes when input reference is a valid array or not exists'
    unset "myArray"
    When call ArrayUtils.anythingToEmpty "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 0
  End

  It 'passes when input reference is a valid array or not exists'
    local myArray=()
    When call ArrayUtils.anythingToEmpty "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 0
  End

    It 'does not preserve array if it already contains values'
    local myArray=("a" "b")
    When call ArrayUtils.anythingToEmpty "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 0
  End
  
End

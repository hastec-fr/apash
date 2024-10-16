Describe 'ArrayUtils.nullToEmpty'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input name is not a valid variable name'
    When call ArrayUtils.nullToEmpty
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name is not a valid variable name'
    When call ArrayUtils.nullToEmpty ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid variable name'
    When call ArrayUtils.nullToEmpty " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid variable name'
    When call ArrayUtils.nullToEmpty "my var"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid variable name'
    When call ArrayUtils.nullToEmpty "1myvar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name refer to variable which is not an array'
    local myVar="test"
    When call ArrayUtils.nullToEmpty "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name refer to variable which is not an array'
    local -A myMap=(["foo"]="a")
    When call ArrayUtils.nullToEmpty "myMap"
    The output should equal ""
    The status should be failure
  End
 
  It 'passes when reference if name is a valid array or not exists'
    unset "myArray"
    When call ArrayUtils.nullToEmpty "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 0    
  End

  It 'passes when reference if name is a valid array or not exists'
    local myArray=()
    When call ArrayUtils.nullToEmpty "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 0    
  End

  It 'preserves array if it already contains values'
    local myArray=("a" "b")
    When call ArrayUtils.nullToEmpty "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 2
    The variable 'myArray[0]' should eq "a"
    The variable 'myArray[1]' should eq "b"
  End
  
End


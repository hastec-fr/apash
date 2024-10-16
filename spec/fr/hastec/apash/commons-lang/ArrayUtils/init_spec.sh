Describe 'ArrayUtils.init'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import fr.hastec.apash.commons-lang.ArrayUtils.init
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input name is not a valid array name'
    When call ArrayUtils.init
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name is not a valid array name'
    When call ArrayUtils.init ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid array name'
    When call ArrayUtils.init " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid array name'
    When call ArrayUtils.init "my var"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid array name'
    When call ArrayUtils.init "1myvar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid array name'
    local myVar="test"
    When call ArrayUtils.init "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid array name'
    local -A myMap=(["foo"]="bar")
    When call ArrayUtils.init "myMap" "a"
    The output should equal ""
    The status should be failure
  End

  It 'passes when reference if name is a valid array or not exists'
    unset "myArray"
    When call ArrayUtils.init "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 0
  End

  It 'passes when reference if name is a valid array or not exists'
    local myArray=()
    When call ArrayUtils.init "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 0
  End
  
  It 'does not preserve array if it already contains values'
    local myArray=("a" "b")
    When call ArrayUtils.init "myArray"
    The output should equal ""
    The status should be success
    The value "${#myArray[@]}" should eq 0
  End

End


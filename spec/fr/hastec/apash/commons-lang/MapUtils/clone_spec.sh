Describe 'MapUtils.clone'
  if [ "$APASH_TEST_MINIFIED" != "true" ]; then
    Include "$APASH_HOME_DIR/src/bash/fr/hastec/apash.import"
    apash.import "fr.hastec.apash.commons-lang.MapUtils.clone"
  else
    Include "$APASH_HOME_DIR/apash-${APASH_SHELL}-min.sh"
  fi

  It 'fails when the input name does not refer to an map'
    When call MapUtils.clone 
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name does not refer to an map'
    When call MapUtils.clone ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an map'
    When call MapUtils.clone " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an map'
    local myVar="test"
    When call MapUtils.clone "myVar" "a"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name does not refer to an map'
    local -a myArray=("bar")
    When call MapUtils.clone "myArray" "myClone"
    The output should equal ""
    The status should be failure
  End

  It 'passes when references are maps'
    local -A myMap=()
    local -A myClone=(["foo"]="bar")
    When call MapUtils.clone "myMap" "myClone"
    The output should equal ""
    The status should be success
    The value "${#myMap[@]}" should eq 0
    The value "${#myClone[@]}" should eq 0
  End

   It 'passes when references are maps'
    local -A myMap=(["foo"]="bar" ["key"]="val")
    local -A myClone=()
    When call MapUtils.clone "myMap" "myClone"
    The output should equal ""
    The status should be success
    The value "${#myMap[@]}" should eq 2
    The value "${#myClone[@]}" should eq 2
    The variable 'myClone[foo]' should eq "bar"
    The variable 'myClone[key]' should eq "val"
  End

  It 'passes when references are maps'
    local -A myMap=(["foo"]="bar" ["key"]="val")
    local -A myClone=(["bat"]="man")
    When call MapUtils.clone "myMap" "myClone"
    The output should equal ""
    The status should be success
    The value "${#myMap[@]}" should eq 2
    The value "${#myClone[@]}" should eq 2
    The variable 'myClone[foo]' should eq "bar"
    The variable 'myClone[key]' should eq "val"
  End

End


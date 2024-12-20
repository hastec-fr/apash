Describe 'MapUtils.init'
  apash.import fr.hastec.apash.commons-lang.MapUtils.init

  It 'fails when the input name is not a valid map name'
    When call MapUtils.init
    The output should equal ""
    The status should be failure
  End
  
  It 'fails when the input name is not a valid map name'
    When call MapUtils.init ""
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid map name'
    When call MapUtils.init " "
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid map name'
    When call MapUtils.init "my var"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid map name'
    When call MapUtils.init "1myvar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid map name'
    local myVar="test"
    When call MapUtils.init "myVar"
    The output should equal ""
    The status should be failure
  End

  It 'fails when the input name is not a valid map name'
    local -a myArray=("foo")
    When call MapUtils.init "myArray"
    The output should equal ""
    The status should be failure
  End

  It 'passes when reference if name is a valid array or not exists'
    unset "myMap"
    When call MapUtils.init "myMap"
    The output should equal ""
    The status should be success
    The value "${#myMap[@]}" should eq 0
  End

  It 'passes when reference if name is a valid array or not exists'
    local -A myMap=()
    When call MapUtils.init "myMap"
    The output should equal ""
    The status should be success
    The value "${#myMap[@]}" should eq 0
  End
  
  It 'does not preserve array if it already contains values'
    local -A myMap=([foo]="a" [bar]="b")
    When call MapUtils.init "myMap"
    The output should equal ""
    The status should be success
    The value "${#myMap[@]}" should eq 0
  End

End


Describe 'FileNameUtils.normalize'
  apash.import "fr.hastec.apash.commons-io.FileNameUtils.normalize"

  It 'passes when the input is empty'
    When call FileNameUtils.normalize 
    The output should equal ""
    The status should be failure
  End

  It 'passes when the input is empty 2'
    When call FileNameUtils.normalize ""
    The output should equal ""
    The status should be failure
  End

  It 'passes when the input contains //'
    When call FileNameUtils.normalize "path//to/file"
    The output should equal "path/to/file"
    The status should be success
  End

  It 'passes when the input contains valid ../'
    When call FileNameUtils.normalize "path/../to/file"
    The output should equal "to/file"
    The status should be success
  End

  It 'passes when the input contains valid ./'
    When call FileNameUtils.normalize "path/./to/file"
    The output should equal "path/to/file"
    The status should be success
  End

  It 'passes when the input contains invalid ../'
    When call FileNameUtils.normalize "../path/to/file"
    The output should equal ""
    The status should be failure
  End

  It 'passes when the input contains invalid ../ ~/../'
    When call FileNameUtils.normalize "~/../path/to/file"
    The output should equal ""
    The status should be failure
  End

  It 'passes when the input contains invalid ../ /../'
    When call FileNameUtils.normalize "/../"
    The output should equal ""
    The status should be failure
  End

  It 'passes when the input contains valid ../ // ./'
    When call FileNameUtils.normalize "path//to/.././"
    The output should equal "path/"
    The status should be success
  End
End

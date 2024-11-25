Describe 'FileNameUtils.getExtension'
  apash.import "fr.hastec.apash.commons-io.FileNameUtils.getExtension"

  It 'passes when the input is empty'
    When call FileNameUtils.getExtension 
    The output should equal ""
    The status should be success
  End

  It 'passes when the input has an extension'
    When call FileNameUtils.getExtension "foo.txt"
    The output should equal "txt"
    The status should be success
  End

  It 'passes when the input refer to a full path'
    When call FileNameUtils.getExtension "a/b/c.jpg"
    The output should equal "jpg"
    The status should be success
  End

  It 'passes and output is empty when there is no extension'
    When call FileNameUtils.getExtension "a/b.txt/c"
    The output should equal ""
    The status should be success
  End

  It 'passes and output is empty when there is no extension'
    When call FileNameUtils.getExtension "a/b/c"
    The output should equal ""
    The status should be success
  End

End

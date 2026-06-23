Describe 'FileNameUtils.getFullPath'
  apash.import "fr.hastec.apash.commons-io.FileNameUtils.getFullPath"

  It 'passes when the input is empty'
    When call FileNameUtils.getFullPath 
    The output should equal ""
    The status should be success
  End

  It 'passes when the input has an extension'
    When call FileNameUtils.getFullPath "foo.txt"
    The output should equal ""
    The status should be success
  End

  It 'passes when the input refer to a full path to a file'
    When call FileNameUtils.getFullPath "path/to/my/file.txt"
    The output should equal "path/to/my/"
    The status should be success
  End

  It 'passes when the input refer to a full path to a directory'
    When call FileNameUtils.getFullPath "path/to/my/dir/"
    The output should equal "path/to/my/dir/"
    The status should be success
  End

  It 'passes when the input is the home directory'
    When call FileNameUtils.getFullPath "~"
    The output should equal "~/"
    The status should be success
  End
  
  It 'passes when the input is the home directory ending with a /'
    When call FileNameUtils.getFullPath "~/"
    The output should equal "~/"
    The status should be success
  End

  It 'passes when the input is the ~user directory'
    When call FileNameUtils.getFullPath "~user"
    The output should equal "~user/"
    The status should be success
  End

  It 'passes when the input is the ~user/ directory'
    When call FileNameUtils.getFullPath "~user/"
    The output should equal "~user/"
    The status should be success
  End

  It 'passes when the input ends with 2 /'
    When call FileNameUtils.getFullPath "path/to//"
    The output should equal "path/to//"
    The status should be success
  End

  It 'passes when the input contains spaces'
    When call FileNameUtils.getFullPath "a/b c/d/"
    The output should equal "a/b c/d/"
    The status should be success
  End

End

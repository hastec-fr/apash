Describe 'FileUtils.isSymlink'
  apash.import "fr.hastec.apash.commons-io.FileUtils.isSymlink"
  
  TMPDIR="${SHELLSPEC_TMPBASE:=/tmp}"
  mkdir -p "$TMPDIR/path/to"
  mkdir -p "$TMPDIR/path/to/dir"
  
  touch "$TMPDIR/regularFile.txt"
  touch "$TMPDIR/regularFile"
  touch "$TMPDIR/path/to/regularFile.txt"
  touch "$TMPDIR/path/to/regularFile"
  
  ln -sf "$TMPDIR/regularFile" "$TMPDIR/thisFileIsASymlink"
  ln -sf "$TMPDIR/path/to/regularFile" "$TMPDIR/path/to/thisFileIsASymlink"
  
  It 'passes when the input is a symbolic link'
    When call FileUtils.isSymlink "$TMPDIR/thisFileIsASymlink"
    The status should be success
  End
  
  It 'passes when the input refer to a full path'
    When call FileUtils.isSymlink "$TMPDIR/path/to/thisFileIsASymlink"
    The status should be success
  End
  
  It 'passes when the input refer to a regular file with extension'
    When call FileUtils.isSymlink "$TMPDIR/regularFile.txt"
    The status should be failure
  End
  
  It 'passes when the input refer to a regular file without extension'
    When call FileUtils.isSymlink "$TMPDIR/regularFile"
    The status should be failure
  End
  
  It 'passes when the input refer to a full path to a regular file with extension'
    When call FileUtils.isSymlink "$TMPDIR/path/to/regularFile.txt"
    The status should be failure
  End
  
  It 'passes when the input refer to a full path to a regular file without extension'
    When call FileUtils.isSymlink "$TMPDIR/path/to/regularFile"
    The status should be failure
  End
  
  It 'passes when the input refer to a directory'
    When call FileUtils.isSymlink "$TMPDIR/path"
    The status should be failure
  End
  
  It 'passes when the input refer to a directory ending with /'
    When call FileUtils.isSymlink "$TMPDIR/path/"
    The status should be failure
  End
  
  It 'passes when the input refer to a path to a directory'
    When call FileUtils.isSymlink "$TMPDIR/path/to"
    The status should be failure
  End
  
  It 'passes when the input does not exist'
    When call FileUtils.isSymlink "$TMPDIR/notFound"
    The status should be failure
  End

End

Describe 'FileUtils.isRegularFile'
  apash.import "fr.hastec.apash.commons-io.FileUtils.isRegularFile"

  Before "each"
    mkdir -p "$TMPDIR/path/to"
    mkdir -p "$TMPDIR/path/to/dir"

    touch "$TMPDIR/regularFile.txt"
    touch "$TMPDIR/regularFile"
    touch "$TMPDIR/path/to/regularFile.txt"
    touch "$TMPDIR/path/to/regularFile"
    
    ln -s "$TMPDIR/regularFile" "$TMPDIR/thisFileIsASymlink"
    ln -s "$TMPDIR/path/to/regularFile" "$TMPDIR/path/to/thisFileIsASymlink"
  End

  It 'passes when the input is a symlink'
    When call FileUtils.isRegularFile "$TMPDIR/thisFileIsASymlink"
    The status should be failure
  End

  It 'passes when the input refer to a full path'
    When call FileUtils.isRegularFile "$TMPDIR/path/to/symlink"
    The status should be failure
  End

  It 'passes when the input refer to a regular file with extension'
    When call FileUtils.isRegularFile "$TMPDIR/regularFile.txt"
    The status should be success
  End

  It 'passes when the input refer to a regular file without extension'
    When call FileUtils.isRegularFile "$TMPDIR/regularFile"
    The status should be success
  End

  It 'passes when the input refer to a full path to a regular file with extension'
    When call FileUtils.isRegularFile "$TMPDIR/path/to/regularFile.txt"
    The status should be success
  End

  It 'passes when the input refer to a full path to a regular file without extension'
    When call FileUtils.isRegularFile "$TMPDIR/path/to/regularFile"
    The status should be success
  End

  It 'passes when the input refer to a directory'
    When call FileUtils.isRegularFile "$TMPDIR/path"
    The status should be failure
  End

  It 'passes when the input refer to a directory ending with /'
    When call FileUtils.isRegularFile "$TMPDIR/path/"
    The status should be failure
  End

  It 'passes when the input refer to a path to a directory'
    When call FileUtils.isRegularFile "$TMPDIR/path/to"
    The status should be failure
  End

  Ir 'passes when the input does not exist'
    When call FileUtils.isRegularFile "$TMPDIR/notFound"
    The status should be failure
  End

End

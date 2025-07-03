Describe 'FileUtils.isDirectory'
  apash.import "fr.hastec.apash.commons-io.FileUtils.isDirectory"

  TMPDIR="/tmp"
  mkdir -p "$TMPDIR/path/to"
  mkdir -p "$TMPDIR/path/to/dir"
 
  touch "$TMPDIR/regularFile.txt"
  touch "$TMPDIR/regularFile"
  touch "$TMPDIR/path/to/regularFile.txt"
  touch "$TMPDIR/path/to/regularFile"

  ln -sf "$TMPDIR/regularFile" "$TMPDIR/thisFileIsASymlink"
  ln -sf "$TMPDIR/path/to/regularFile" "$TMPDIR/path/to/thisFileIsASymlink"
  ln -sf "$TMPDIR/path" "$TMPDIR/thisIsASymLinkToADir"

  It 'passes when the input is a symlink'
    When call FileUtils.isDirectory "$TMPDIR/thisFileIsASymlink"
    The status should be failure
  End
  
  It 'passes when the input refer to a full path'
    When call FileUtils.isDirectory "$TMPDIR/path/to/thisFileIsASymlink"
    The status should be failure
  End
  
  It 'passes when the input refer to a full path with a symlink'
    When call FileUtils.isDirectory "$TMPDIR/thisIsASymLinkToADir"
    The status should be success
  End

  It 'passes when the input refer to a full path with a symlink in it'
    When call FileUtils.isDirectory "$TMPDIR/thisIsASymLinkToADir/to"
    The status should be success
  End

  It 'passes when the input refer to a symlink which points to a directory with arg NOFOLLOW_LINKS'
    When call FileUtils.isDirectory "$TMPDIR/thisIsASymLinkToADir" "NOFOLLOW_LINKS"
    The status should be failure
  End

  It 'passes when the input refer to a full path with a symlink in it with arg NOFOLLOW_LINKS'
    When call FileUtils.isDirectory "$TMPDIR/thisIsASymLinkToADir/to" "NOFOLLOW_LINKS"
    The status should be failure
  End

  It 'passes when the input refer to a regular file with extension'
    When call FileUtils.isDirectory "$TMPDIR/regularFile.txt"
    The status should be failure
  End
  
  It 'passes when the input refer to a regular file without extension'
    When call FileUtils.isDirectory "$TMPDIR/regularFile"
    The status should be failure
  End
  
  It 'passes when the input refer to a full path to a regular file with extension'
    When call FileUtils.isDirectory "$TMPDIR/path/to/regularFile.txt"
    The status should be failure
  End
  
  It 'passes when the input refer to a full path to a regular file without extension'
    When call FileUtils.isDirectory "$TMPDIR/path/to/regularFile"
    The status should be failure
  End
  
  It 'passes when the input refer to a directory'
    When call FileUtils.isDirectory "$TMPDIR/path"
    The status should be success
  End
  
  It 'passes when the input refer to a directory ending with /'
    When call FileUtils.isDirectory "$TMPDIR/path/"
    The status should be success
  End
  
  It 'passes when the input refer to a path to a directory'
    When call FileUtils.isDirectory "$TMPDIR/path/to"
    The status should be success
  End
  
  It 'passes when the input does not exist'
    When call FileUtils.isDirectory "$TMPDIR/notFound"
    The status should be failure
  End

End

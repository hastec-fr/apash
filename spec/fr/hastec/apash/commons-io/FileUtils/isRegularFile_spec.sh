Describe 'FileUtils.isRegularFile'
  apash.import "fr.hastec.apash.commons-io.FileUtils.isRegularFile"

  TMPDIR="${SHELLSPEC_TMPBASE}"
  mkdir -p "$TMPDIR/path/to"
  mkdir -p "$TMPDIR/path/to/dir"
  
  touch "$TMPDIR/regularFile.txt"
  touch "$TMPDIR/regularFile"
  touch "$TMPDIR/path/to/regularFile.txt"
  touch "$TMPDIR/path/to/regularFile"
  
  ln -sf "$TMPDIR/regularFile" "$TMPDIR/thisFileIsASymlink"
  ln -sf "$TMPDIR/path/to/regularFile" "$TMPDIR/path/to/thisFileIsASymlink"
  ln -sf "$TMPDIR/path" "$TMPDIR/thisIsASymLinkToADir"
  
  It 'passes when the input is a symlink which points to a file'
    When call FileUtils.isRegularFile "$TMPDIR/thisFileIsASymlink"
    The status should be success
  End
  
  It 'passes when the input is the symlink file itself with NOFOLLOW_LINKS link option'
    When call FileUtils.isRegularFile "$TMPDIR/thisFileIsASymlink" "NOFOLLOW_LINKS"
    The status should be failure
  End
  
  It 'passes when the input refer to a full path ending in a symlink which points to a file'
    When call FileUtils.isRegularFile "$TMPDIR/path/to/thisFileIsASymlink"
    The status should be success
  End
 
  It 'passes when the input refer to a full path ending in a symlink with NOFOLLOW_LINKS link option'
    When call FileUtils.isRegularFile "$TMPDIR/path/to/thisFileIsASymlink" "NOFOLLOW_LINKS"
    The status should be failure
  End 
  
  It 'passes when the input refer to a symlink which points to a dir'
    When call FileUtils.isRegularFile "$TMPDIR/thisIsASymLinkToADir"
    The status should be failure
  End
  
  It 'passes when the input refer to a symlink which points to a dir with NOFOLLOW_LINKS link option'
    When call FileUtils.isRegularFile "$TMPDIR/thisIsASymLinkToADir" "NOFOLLOW_LINKS"
    The status should be failure
  End 
 
  It 'passes when the input refer to a file with a symlink in the path'
    When call FileUtils.isRegularFile "$TMPDIR/thisIsASymLinkToADir/to/regularFile.txt"
    The status should be success
  End 

  It 'passes when the input refer to a file with a symlink in the path with NOFOLLOW_LINKS link option'
    When call FileUtils.isRegularFile "$TMPDIR/thisIsASymLinkToADir/to/regularFile.txt" "NOFOLLOW_LINKS"
    The status should be success
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
  
  It 'passes when the input does not exist'
    When call FileUtils.isRegularFile "$TMPDIR/notFound"
    The status should be failure
  End

End

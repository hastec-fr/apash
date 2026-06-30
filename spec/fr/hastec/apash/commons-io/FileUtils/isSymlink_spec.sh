Describe 'FileUtils.isSymlink'
  apash.import "fr.hastec.apash.commons-io.FileUtils.isSymlink"
  
  TMPDIR="${SHELLSPEC_TMPBASE:=/tmp}"
  RELPATH=".$(realpath "$PWD" | sed -E 's:/[^/]+:/..:g')$TMPDIR"

  mkdir -p "$TMPDIR/path/to"
  mkdir -p "$TMPDIR/path/to/dir"
  
  touch "$TMPDIR/regularFile.txt"
  touch "$TMPDIR/regularFile"
  touch "$TMPDIR/path/to/regularFile.txt"
  touch "$TMPDIR/path/to/regularFile"
  
  # @todo: create function to detect the OS (Windows, GNU/Linux ...)
  # Windows does not support the way to create a symbolic link without admin rights.
  ln -sf "$TMPDIR/regularFile" "$TMPDIR/thisFileIsASymlink"
  ln -sf "$TMPDIR/path/to/regularFile" "$TMPDIR/path/to/thisFileIsASymlink"
  
  # Windows does not support the way to create a symbolic link without admin rights.
  It 'passes when the input is a symbolic link'
    Skip if "is gitbash" global_helper_is_gitbash
    When call FileUtils.isSymlink "$TMPDIR/thisFileIsASymlink"
    The status should be success
  End
  
  # Windows does not support the way to create a symbolic link without admin rights.
  It 'passes when the input refer to a full path'
    Skip if "is gitbash" global_helper_is_gitbash
    When call FileUtils.isSymlink "$RELPATH/path/to/thisFileIsASymlink"
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

  # Windows does not support the way to create a symbolic link without admin rights.
  It 'passes when the input is a relative path to a symlink'
    Skip if "is gitbash" global_helper_is_gitbash
    When call FileUtils.isSymlink "$RELPATH/path/to/thisFileIsASymlink"
    The status should be success
  End

  It 'passes when the input is a relative path to a directory'
    When call FileUtils.isSymlink "$RELPATH/path/to"
    The status should be failure
  End

  It 'passes when the input is a relative path to a regular file'
    When call FileUtils.isSymlink "$RELPATH/path/to/regularFile"
    The status should be failure
  End
End

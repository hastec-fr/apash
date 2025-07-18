Describe 'FileUtils.copyFile'
  apash.import "fr.hastec.apash.commons-io.FileUtils.copyFile"

  TMPDIR="${SHELLSPEC_TMPBASE}"
  mkdir -p "$TMPDIR/path/to"
  mkdir -p "$TMPDIR/path/to/dir"
 
  touch "$TMPDIR/path/to/srcFile.txt"
  touch "$TMPDIR/path/to/dstFile.txt"

  touch "$TMPDIR/srcFile.txt"
  touch "$TMPDIR/dstFile.txt"

  Path srcFile=$TMPDIR/srcFile.txt
  Path anotherSrcFile=$TMPDIR/path/to/srcFile.txt
  Path dstFile=$TMPDIR/dstFile.txt
  Path anotherDstFile=$TMPDIR/path/to/dstFile.txt
  Path fileThatDoesntExistYet=$TMPDIR/dirThatDoesntExistsYet/dstThatDoesntExistsYet.txt

  SRCFILECONTENT="this is the content of the source file"
  ANOTHERSRCFILECONTENT="this is the content of another the source file"
  DSTFILECONTENT="this is the content of the destination file"
  ANOTHERDSTFILECONTENT="this is the content of the other destination file"

  echo "$SRCFILECONTENT" > "$TMPDIR/srcFile.txt"
  echo "$ANOTHERSRCFILECONTENT" > "$TMPDIR/path/to/srcFile.txt"

  It 'passes when the input is just a source and a destination'
    When call FileUtils.copyFile "$TMPDIR/srcFile.txt" "$TMPDIR/dstFile.txt" false "REPLACE_EXISTING"
    The status should be success
    The contents of path dstFile should equal "$SRCFILECONTENT"
  End

  echo "$DSTFILECONTENT" > "$TMPDIR/dstFile.txt"
  echo "$ANOTHERDSTFILECONTENT" > "$TMPDIR/path/to/dstFile.txt"
  
  It 'passes when the input is a source and a destination with full path'
    When call FileUtils.copyFile "$TMPDIR/path/to/srcFile.txt" "$TMPDIR/path/to/dstFile.txt" false "REPLACE_EXISTING"
    The status should be success
    The contents of path anotherDstFile should equal "$ANOTHERSRCFILECONTENT"
  End
 
  echo "$SRCFILECONTENT" > "$TMPDIR/srcFile.txt"
  echo "$DSTFILECONTENT" > "$TMPDIR/dstFile.txt"

  It 'passes when the input is just a source and a destination and preserve date'
    When call FileUtils.copyFile "$TMPDIR/srcFile.txt" "$TMPDIR/dstFile.txt" true "REPLACE_EXISTING"
    The status should be success
    The contents of path dstFile should equal "$SRCFILECONTENT"
  End
  
  It 'preserves modification date'
    src_mtime="$(stat -c %Y "$TMPDIR/srcFile.txt")"
    dst_mtime="$(stat -c %Y "$TMPDIR/dstFile.txt")"
    When call test "$src_mtime" -eq "$dst_mtime"
    The status should be success
  End

  echo "$SRCFILECONTENT" > "$TMPDIR/srcFile.txt"
  echo "$DSTFILECONTENT" > "$TMPDIR/dstFile.txt"

  It 'passes when the input is a source and a destination and the dst should not be replaced'
    When call FileUtils.copyFile "$TMPDIR/srcFile.txt" "$TMPDIR/dstFile.txt" false 
    The contents of path dstFile should equal "$DSTFILECONTENT"
    The status should be success
  End

  echo "$SRCFILECONTENT" > "$TMPDIR/srcFile.txt"

  It 'passes when the input is a source and a destination that must be created'
    When call FileUtils.copyFile "$TMPDIR/srcFile.txt" "$TMPDIR/dirThatDoesntExistsYet/dstThatDoesntExistsYet.txt"
    The status should be success
    The contents of path fileThatDoesntExistYet should equal "$SRCFILECONTENT"
  End

End

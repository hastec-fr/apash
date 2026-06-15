Describe 'FileUtils.copyFile'
  apash.import "fr.hastec.apash.commons-io.FileUtils.copyFile"

  TMPDIR="/tmp"
  mkdir -p "$TMPDIR/path/to"
  mkdir -p "$TMPDIR/path/to/dir"
 
  touch "$TMPDIR/path/to/srcFile.txt"
  touch "$TMPDIR/path/to/dstFile.txt"

  touch "$TMPDIR/srcFile.txt"
  touch "$TMPDIR/dstFile.txt"

  echo "this is the content of the source file" > "$TMPDIR/srcFile.txt"
  echo "this is the content of another source file" > "$TMPDIR/path/to/srcFile.txt"

  It 'passes when the input is just a source and a destination'
    When call FileUtils.copyFile "$TMPDIR/srcFile.txt" "$TMPDIR/dstFile.txt" false "REPLACE_EXISTING"
    The status should be success
  End

  It 'passes when the content of the source and destination are equal'
    When call diff "$TMPDIR/srcFile.txt" "$TMPDIR/dstFile.txt" 
    The output should equal ""
    The status should be success
  End

  echo "this is the destination" > "$TMPDIR/dstFile.txt"
  echo "this is the other destination" > "$TMPDIR/path/to/dstFile.txt"
  
  It 'passes when the input is a source and a destination with full path'
    When call FileUtils.copyFile "$TMPDIR/path/to/srcFile.txt" "$TMPDIR/path/to/dstFile.txt" false "REPLACE_EXISTING"

    The status should be success
  End

  It 'passes when the content of the source and destination are equal'
    When call diff "$TMPDIR/path/to/srcFile.txt" "$TMPDIR/path/to/dstFile.txt" 
    The output should equal ""
    The status should be success
  End
  
  echo "this is the content of the source file" > "$TMPDIR/srcFile.txt"
  echo "this is the destination" > "$TMPDIR/dstFile.txt"

  It 'passes when the input is just a source and a destination and preserve date'
    When call FileUtils.copyFile "$TMPDIR/srcFile.txt" "$TMPDIR/dstFile.txt" true "REPLACE_EXISTING"
    The status should be success
  End

  It 'passes when the content of the source and destination are equal'
    When call diff "$TMPDIR/srcFile.txt" "$TMPDIR/dstFile.txt"
    The output should equal ""
    The status should be success
  End
  
  It 'preserves modification date'
    src_mtime="$(stat -c %Y "$TMPDIR/srcFile.txt")"
    dst_mtime="$(stat -c %Y "$TMPDIR/dstFile.txt")"
    When call test "$src_mtime" -eq "$dst_mtime"
    The status should be success
  End

  echo "this is the content of the source file" > "$TMPDIR/srcFile.txt"
  echo "this is the destination" > "$TMPDIR/dstFile.txt"

  It 'passes when the input is a source and a destination and the dst should not be replaced'
    When call FileUtils.copyFile "$TMPDIR/srcFile.txt" "$TMPDIR/dstFile.txt" false 
    The status should be success
  End

  It 'passes when the content of the source and destination are equal'
    When call diff "$TMPDIR/srcFile.txt" "$TMPDIR/dstFile.txt"
    The output should not equal ""
    The status should be failure
  End
  
  echo "this is the content of the source file" > "$TMPDIR/srcFile.txt"

  It 'passes when the input is a source and a destination that must be created'
    When call FileUtils.copyFile "$TMPDIR/srcFile.txt" "$TMPDIR/dirThatDoesntExistsYet/dstThatDoesntExistsYet.txt"
    The status should be success
  End

  It 'passes when the content of the source and destination are equal'
    When call diff "$TMPDIR/srcFile.txt" "$TMPDIR/dirThatDoesntExistsYet/dstThatDoesntExistsYet.txt"
    The output should equal ""
    The status should be success
  End
End

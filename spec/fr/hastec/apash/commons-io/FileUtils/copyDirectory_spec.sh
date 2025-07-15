Describe 'FileUtils.copyDirectory'
  apash.import "fr.hastec.apash.commons-io.FileUtils.copyDirectory"

  TMPDIR="/tmp"
  rm -rf "$TMPDIR/path"
  mkdir -p "$TMPDIR/path/to/dir" 

  mkdir -p "$TMPDIR/dest"

  touch "$TMPDIR/path/to/dir/file1"
  touch "$TMPDIR/path/to/dir/file2"
  touch "$TMPDIR/path/to/file3"
  touch "$TMPDIR/path/file4"

  touch "$TMPDIR/dest/file4"
  
  echo "file1 content" > "$TMPDIR/path/to/dir/file1"
  echo "file2 content" > "$TMPDIR/path/to/dir/file2"
  echo "file3 content" > "$TMPDIR/path/to/file3"
  echo "file4 content" > "$TMPDIR/path/file4"
  
  echo "file4 content that is not overwritten" > "$TMPDIR/dest/file4"

  It 'passes when the input is source, destination, file filter'
    When call FileUtils.copyDirectory "$TMPDIR/path" "$TMPDIR/dest" "*" 
    The status should be success
  End

  It "passes when file1 has been created and copied correctly"
    When call diff "$TMPDIR/dest/to/dir/file1" "$TMPDIR/path/to/dir/file1"
    The output should equal ""
    The status should be success
  End

  It "passes when file2 has been created and copied correctly"
    When call diff "$TMPDIR/dest/to/dir/file2" "$TMPDIR/path/to/dir/file2"
    The output should equal ""
    The status should be success
  End

  It "passes when file3 has been created and copied correctly"
    When call diff "$TMPDIR/dest/to/file3" "$TMPDIR/path/to/file3"
    The output should equal ""
    The status should be success
  End

  It "passes when file4 has been not been overwritten"
    When call diff "$TMPDIR/dest/file4" "$TMPDIR/path/file4"
    The output should not equal ""
    The status should be failure
  End

  rm -rf "$TMPDIR/dest"
  mkdir "$TMPDIR/dest"
  touch "$TMPDIR/dest/file4"
  echo "file4 content that is not overwritten" > "$TMPDIR/dest/file4"
  
  It 'passes when the input is a source, a destination with preserve date enable and REPLACE_EXISTING'
    When call FileUtils.copyDirectory "$TMPDIR/path" "$TMPDIR/dest" "*" true "REPLACE_EXISTING"
    The status should be success
  End

  It "passes when file1 has been created and copied correctly"
    When call diff "$TMPDIR/dest/to/dir/file1" "$TMPDIR/path/to/dir/file1"
    The output should equal ""
    The status should be success
  End

  It "passes when file2 has been created and copied correctly"
    When call diff "$TMPDIR/dest/to/dir/file2" "$TMPDIR/path/to/dir/file2"
    The output should equal ""
    The status should be success
  End

  It "passes when file3 has been created and copied correctly"
    When call diff "$TMPDIR/dest/to/file3" "$TMPDIR/path/to/file3"
    The output should equal ""
    The status should be success
  End

  It "passes when file4 has been not been overwritten"
    When call diff "$TMPDIR/dest/file4" "$TMPDIR/path/file4"
    The output should equal ""
    The status should be success
  End

  It 'preserves modification date of file1'
    src_mtime="$(stat -c %Y "$TMPDIR/path/to/dir/file1")"
    dst_mtime="$(stat -c %Y "$TMPDIR/dest/to/dir/file1")"
    When call test "$src_mtime" -eq "$dst_mtime"
    The status should be success
  End

  It 'preserves modification date of file2'
    src_mtime="$(stat -c %Y "$TMPDIR/path/to/dir/file2")"
    dst_mtime="$(stat -c %Y "$TMPDIR/dest/to/dir/file2")"
    When call test "$src_mtime" -eq "$dst_mtime"
    The status should be success
  End

  It 'preserves modification date of file3'
    src_mtime="$(stat -c %Y "$TMPDIR/path/to/file3")"
    dst_mtime="$(stat -c %Y "$TMPDIR/dest/to/file3")"    
    When call test "$src_mtime" -eq "$dst_mtime"
    The status should be success
  End

  It 'preserves modification date of file4'
    src_mtime="$(stat -c %Y "$TMPDIR/path/file4")"
    dst_mtime="$(stat -c %Y "$TMPDIR/dest/file4")"
    When call test "$src_mtime" -eq "$dst_mtime"
    The status should be success
  End

  rm -rf "$TMPDIR/dest"
  mkdir "$TMPDIR/dest"
  touch "$TMPDIR/dest/file4"
  
  touch "$TMPDIR/path/file5"
  touch "$TMPDIR/path/file65"
  echo "file4 content that is not overwritten" > "$TMPDIR/dest/file4"
  echo "file5 content" > "$TMPDIR/path/file5"
  echo "file65 content" > "$TMPDIR/path/file65"

  It 'passes when the input is source, destination, file filter'
    When call FileUtils.copyDirectory "$TMPDIR/path" "$TMPDIR/dest" "*5" 
    The status should be success
  End

  It "passes when file1 has been created and copied correctly"
    When call diff "$TMPDIR/dest/file5" "$TMPDIR/path/file5"
    The output should equal ""
    The status should be success
  End

  It "passes when file1 has been created and copied correctly"
    When call diff "$TMPDIR/dest/file65" "$TMPDIR/path/file65"
    The output should equal ""
    The status should be success
  End
End

Describe 'FileUtils.copyDirectory'
  apash.import "fr.hastec.apash.commons-io.FileUtils.copyDirectory"

  TMPDIR="${SHELLSPEC_TMPBASE:=/tmp}"
  RELPATH=".$(echo "$(pwd)" | sed -E 's/\/[^\/]+/\/../g')/${TMPDIR#/home}"

  rm -rf "$TMPDIR/path"
  mkdir -p "$TMPDIR/path/to/dir" 

  mkdir -p "$TMPDIR/dest"

  touch "$TMPDIR/path/to/dir/file1"
  touch "$TMPDIR/path/to/dir/file2"
  touch "$TMPDIR/path/to/file3"
  touch "$TMPDIR/path/file4"

  touch "$TMPDIR/dest/file4"
 
  Path "file1=$TMPDIR/path/to/dir/file1"
  Path "file2=$TMPDIR/path/to/dir/file2"
  Path "file3=$TMPDIR/path/to/file3"
  Path "file4=$TMPDIR/path/file4"
  Path "file5=$TMPDIR/path/file5"
  Path "file65=$TMPDIR/path/file65"
  
  Path "file1bis=$TMPDIR/dest/to/dir/file1"
  Path "file2bis=$TMPDIR/dest/to/dir/file2"
  Path "file3bis=$TMPDIR/dest/to/file3"
  Path "file4bis=$TMPDIR/dest/file4"
  Path "file5bis=$TMPDIR/dest/file5"
  Path "file65bis=$TMPDIR/dest/file65"
  
  FILE1CONTENT="file1 content"
  FILE2CONTENT="file2 content"
  FILE3CONTENT="file3 content"
  FILE4CONTENT="file4 content"
  FILE5CONTENT="file5 content"
  FILE65CONTENT="file65 content"

  FILE4CONTENTBIS="file4 content that is not overwritten"

  echo "$FILE1CONTENT" > "$TMPDIR/path/to/dir/file1"
  echo "$FILE2CONTENT" > "$TMPDIR/path/to/dir/file2"
  echo "$FILE3CONTENT" > "$TMPDIR/path/to/file3"
  echo "$FILE4CONTENT" > "$TMPDIR/path/file4"
  
  echo "$FILE4CONTENTBIS" > "$TMPDIR/dest/file4"

  It 'passes when the input is source, destination, file filter'
    When call FileUtils.copyDirectory "$TMPDIR/path" "$TMPDIR/dest" "*" 
    The status should be success
    The contents of path file1bis should equal "$FILE1CONTENT" 
    The contents of path file2bis should equal "$FILE2CONTENT" 
    The contents of path file3bis should equal "$FILE3CONTENT" 
    The contents of path file4bis should equal "$FILE4CONTENTBIS" 
  End

  rm -rf "$TMPDIR/dest"
  mkdir "$TMPDIR/dest"
  touch "$TMPDIR/dest/file4"
  echo "$FILE4CONTENTBIS" > "$TMPDIR/dest/file4"

  It 'passes when the input is source, destination, file filter (source and destination end with /)'
    When call FileUtils.copyDirectory "$TMPDIR/path" "$TMPDIR/dest" "*" 
    The status should be success
    The contents of path file1bis should equal "$FILE1CONTENT" 
    The contents of path file2bis should equal "$FILE2CONTENT" 
    The contents of path file3bis should equal "$FILE3CONTENT" 
    The contents of path file4bis should equal "$FILE4CONTENTBIS" 
  End

  rm -rf "$TMPDIR/dest"
  mkdir "$TMPDIR/dest"
  touch "$TMPDIR/dest/file4"
  echo "$FILE4CONTENTBIS" > "$TMPDIR/dest/file4"
  
  It 'passes when the input is a source, a destination with preserve date enable and REPLACE_EXISTING'
    When call FileUtils.copyDirectory "$TMPDIR/path" "$TMPDIR/dest" "*" true "REPLACE_EXISTING"
    The status should be success
    The contents of path file1bis should equal "$FILE1CONTENT" 
    The contents of path file2bis should equal "$FILE2CONTENT" 
    The contents of path file3bis should equal "$FILE3CONTENT" 
    The contents of path file4bis should equal "$FILE4CONTENT" 
  End

  #TODO find a better way to test this
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
  echo "$FILE4CONTENTBIS" > "$TMPDIR/dest/file4"
  
  touch "$TMPDIR/path/file5"
  touch "$TMPDIR/path/file65"
  echo "$FILE5CONTENT" > "$TMPDIR/path/file5"
  echo "$FILE65CONTENT" > "$TMPDIR/path/file65"

  It 'passes when the input is source, destination, file filter'
    When call FileUtils.copyDirectory "$TMPDIR/path" "$TMPDIR/dest" "*5" 
    The status should be success
    The contents of path file5bis should equal "$FILE5CONTENT"
    The contents of path file65bis should equal "$FILE65CONTENT"
  End

  It 'passes when the input is a relative path'
    When call FileUtils.copyDirectory "$RELPATH/path" "$RELPATH/dest"
    The contents of path file1bis should equal "$FILE1CONTENT" 
    The contents of path file2bis should equal "$FILE2CONTENT" 
    The contents of path file3bis should equal "$FILE3CONTENT" 
    The contents of path file4bis should equal "$FILE4CONTENTBIS" 
  End

  It 'passes when the input is a source, a destination with preserve and REPLACE_EXISTING , COPY_ATTRIBUTES'
    When call FileUtils.copyDirectory "$TMPDIR/path" "$TMPDIR/dest" "*" true "REPLACE_EXISTING , COPY_ATTRIBUTES"
    The status should be success
    The contents of path file1bis should equal "$FILE1CONTENT" 
    The contents of path file2bis should equal "$FILE2CONTENT" 
    The contents of path file3bis should equal "$FILE3CONTENT" 
    The contents of path file4bis should equal "$FILE4CONTENT" 
  End

End

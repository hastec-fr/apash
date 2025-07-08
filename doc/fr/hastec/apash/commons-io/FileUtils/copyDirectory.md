
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# FileNameUtils.copyDirectory
Copies a filtered directory to a new location.
## Description
   This method copies the contents of the specified source directory to within the specified destination directory.
   The destination directory is created if it does not exist.
   If the destination directory does exist, then this method merges the source with the destination,
   with the source taking precedence. 

## History
### Since
  * 0.2.0 (Guilhem Baechler)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-io](../../commons-io.md) / [FileUtils](../FileUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default | Description                        |
 |--------|----------------|---------------|----------|---------|------------------------------------|
 | $1     | inSrc          | string        | in       |         | The folder name to copy.           |
 | $2     | inDst          | string        | in       |         | The destination folder name.       |
 | $3     | inFileFilter   | string        | in       | .*      | The file name filter. (regex)      |
 | $4     | inPreserveDate | boolean       | in       | false   | Tells if the date should be copied |
 | $5     | inCopyOption   | string        | in       |         | The copy options separated by a ','|

### Example
 ```bash
   FileUtils.copyDirectory "path" "dest"                                       # copies all path directory and sub directories in dest without replacing existing files 
   FileUtils.copyDirectory "path" "dest" ".*1"                                 # copies all path directory and sub directories that ends with '1' in dest without replacing existing files 
   FileUtils.copyDirectory "path" "dest" ".*" true                             # copies all path directory and sub directories in dest without replacing existing files but it copies file dates 
   FileUtils.copyDirectory "path" "dest" ".*" true "REPLACE_EXISTING"          # copies all path directory and sub directories in dest without replacing existing files but it copies file dates and replace files that have same names 
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: when the inSrc has been copied in inDst.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


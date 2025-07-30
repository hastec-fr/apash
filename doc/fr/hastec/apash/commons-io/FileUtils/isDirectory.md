
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# FileNameUtils.isDirectory
Tests whether the specified File is a directory or not.
## Description
   This method returns 0 or 1 depending on whether the argument is a directory or not

## History
### Since
  * 0.3.0 (Guilhem Baechler)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-io](../../commons-io.md) / [FileUtils](../FileUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description               |
 |--------|----------------|---------------|----------|------------|---------------------------|
 | $1     | inFolderName   | string        | in       |            | The folder name to test.  |
 | $2     | inLinkOption   | string        | in       |            | The symbolic link options |

### Example
 ```bash
    FileUtils.isDirectory "regularFile.txt"                              #1
    FileUtils.isDirectory "directory"                                    #0
    FileUtils.isDirectory "directory/symlink/otherDir" "NOFOLLOW_LINKS"  #1
    FileUtils.isDirectory "symlink"                                      #1
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: when the inFolderName points to a directory.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


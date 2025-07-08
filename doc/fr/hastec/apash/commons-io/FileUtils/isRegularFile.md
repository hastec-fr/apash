
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


 File description ###########################################################
# FileNameUtils.isRegularFile
Tests whether the specified File is a regular file or not.
## Description
   This method returns 0 or 1 depending on whether the argument is a regular file or not  

## History
### Since
  * 0.2.0 (Guilhem Baechler)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-io](../../commons-io.md) / [FileUtils](../FileUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description               |
 |--------|----------------|---------------|----------|------------|---------------------------|
 | $1     | inFileName     | string        | in       |            | The file name to test.    |
 | $2     | inLinkOption   | string        | in       |            | The symbolic link options |

### Example
 ```bash
    FileUtils.isRegularFile "regularFile.txt"                                    #0
    FileUtils.isRegularFile "notARegularFile"                                    #1
    FileUtils.isRegularFile "symlinkToADir"                                      #1
    FileUtils.isRegularFile "path/to/symlink/regularFile.txt" "NOFOLLOW_LINKS"   #0
    FileUtils.isRegularFile "symlink" "NOFOLLOW_LINKS"                           #0
    FileUtils.isRegularFile "symlinkToADir" "NOFOLLOW_LINKS"                     #0
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: when the given file is a regular file.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


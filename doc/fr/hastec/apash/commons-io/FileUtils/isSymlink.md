
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


 File description ###########################################################
# FileNameUtils.isSymlink
Tests whether the specified File is a symbolic link rather than an actual file.
## Description
   This method returns 0 or 1 depending on whether the argument is a symbolic link or not  

## History
### Since
  * 0.2.0 (Guilhem Baerchler)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-io](../../commons-io.md) / [FileUtils](../FileUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description            |
 |--------|----------------|---------------|----------|------------|------------------------|
 | $1     | inFileName     | string        | in       |            | The file name to test. |

### Example
 ```bash
    FileUtils.isSymlink "regularFile.txt"  #1
    FileUtils.isSymlink "notARegularFile"  #1
    FileUtils.isSymlink "symlink"          #0
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: when the given file is a symbolic link.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


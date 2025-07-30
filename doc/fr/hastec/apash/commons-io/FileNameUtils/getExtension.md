
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# FileNameUtils.getExtension
Gets the extension of a fileName.
## Description
   This method returns the textual part of the file name after the last dot. 
   There must be no directory separator after the dot.
   Only the last extension is returned.

## History
### Since
  * 0.2.0 (Benjamin Vargin)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-io](../../commons-io.md) / [FileNameUtils](../FileNameUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                                 |
 |--------|----------------|---------------|----------|------------|---------------------------------------------|
 | $1     | inFileName     | string        | in       |            | The file name to retrieve the extension of. |

### Example
 ```bash
    FileNameUtils.getExtension  "foo.txt"          # "txt"
    FileNameUtils.getExtension  "a/b/c.jpg"        # "jpg"
    FileNameUtils.getExtension  "a/b.txt/c"        # ""
    FileNameUtils.getExtension  "a/b/c"            # ""
    FileNameUtils.getExtension  "a/b/c.txt.tmp"    # ".tmp"
 ```

### Stdout
  * The extension of the file or an empty string if none exists.
### Stderr
  * None.

### Exit codes
  * **0**: When result is displayed.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


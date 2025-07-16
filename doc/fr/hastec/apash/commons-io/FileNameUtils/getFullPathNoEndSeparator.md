
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# FileNameUtils.getFullPathNoEndSeparator
Gets the full path (prefix + path) from a full file name, excluding the final directory separator.
## Description
  The method is entirely text based,
  and returns the text before the last forward or backslash.

## History
### Since
  * 0.3.0 (Guilhem Baechler)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-io](../../commons-io.md) / [FileNameUtils](../FileNameUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                                 |
 |--------|----------------|---------------|----------|------------|---------------------------------------------|
 | $1     | inFileName     | string        | in       |            | The file name to retrieve the full path of. |

### Example
 ```bash
    FileNameUtils.getFullPathNoEndSeparator  "foo.txt"          # ""
    FileNameUtils.getFullPathNoEndSeparator  "a/b/c.jpg"        # "a/b/c"
    FileNameUtils.getFullPathNoEndSeparator  "a/b/c"            # "a/b/c"
    FileNameUtils.getFullPathNoEndSeparator  "a/b/c/"           # "a/b/c"
    FileNameUtils.getFullPathNoEndSeparator  "a/b/c//"           # "a/b/c/"
 ```

### Stdout
  * The path of the file, an empty string if none exists
### Stderr
  * None.

### Exit codes
  * **0**: When result is displayed.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


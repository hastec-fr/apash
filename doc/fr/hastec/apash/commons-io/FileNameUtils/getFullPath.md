
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# FileNameUtils.getFullPath
Gets the full path (prefix + path) from a full file name.
## Description
  The method is entirely text based,
  and returns the text before and including the last forward or backslash.

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
    FileNameUtils.getFullPath  "foo.txt"          # ""
    FileNameUtils.getFullPath  "a/b/c.jpg"        # "a/b/"
    FileNameUtils.getFullPath  "a/b/c"            # "a/b/c/"
    FileNameUtils.getFullPath  "a/b/c/"           # "a/b/c/"
    FileNameUtils.getFullPath  "a/b c/"           # "a/b c/"
    FileNameUtils.getFullPath  "a/b/c//"          # "a/b/c//"
    FileNameUtils.getFullPath  "~"                # "~/"
    FileNameUtils.getFullPath  "~/"               # "~/"
    FileNameUtils.getFullPath  "~user"            # "~user/"
    FileNameUtils.getFullPath  "~user/"           # "~user/"
 ```

### Stdout
  * The path of the file, an empty string if none exists
### Stderr
  * None.

### Exit codes
  * **0**: When result is displayed.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


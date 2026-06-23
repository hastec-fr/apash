
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# FileNameUtils.normalize
Normalizes a path, removing double and single period path steps.
## Description
  This method normalizes a path to a standard format.

## History
### Since
  * 0.3.0 (Guilhem Baechler)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-io](../../commons-io.md) / [FileNameUtils](../FileNameUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                |
 |--------|----------------|---------------|----------|------------|----------------------------|
 | $1     | inFileName     | string        | in       |            | The file name to normalize |

### Example
 ```bash
    FileNameUtils.normalize "/foo//"              # /foo/
    FileNameUtils.normalize "/foo/./"             # /foo/
    FileNameUtils.normalize "/foo/../bar"         # /bar
    FileNameUtils.normalize "/foo/../bar/"        # /bar/
    FileNameUtils.normalize "/foo/../bar/../baz"  # /baz
    FileNameUtils.normalize "//foo//./bar"        # /foo/bar
    FileNameUtils.normalize "/../"                # (exitcode 1)
    FileNameUtils.normalize "../foo"              # (exitcode 1)
    FileNameUtils.normalize "foo/bar/.."          # foo/
    FileNameUtils.normalize "foo/../../bar"       # (exitcode 1)
    FileNameUtils.normalize "foo/../bar"          # bar
    FileNameUtils.normalize "//server/foo/../bar" # //server/bar
    FileNameUtils.normalize "//server/../bar"     # (exitcode 1)
    FileNameUtils.normalize "~/foo/../bar/"       # ~/bar/
    FileNameUtils.normalize "~/../bar"            # (exitcode 1)
 ```

### Stdout
  * The normalized form of inFileName or an empty string if inFileName is invalid
### Stderr
  * None.

### Exit codes
  * **0**: When an empty string is displayed.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


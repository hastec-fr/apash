
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# StringUtils.remove
Removes all occurrences of a substring from within the source string.
## Description
   An empty ("") source string will return the empty string.
   An empty ("") remove string will return the source string.

## History
### Since
  * 0.1.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                           |
 |--------|----------------|---------------|----------|------------|---------------------------------------|
 | $1     | inString       | string        | in       |            | The string to modify.                 |
 | $2     | inSubstring    | string        | in       |            | The substring to remove within the input string. |

### Example
 ```bash
    StringUtils.remove ""                   ""       # ""
    StringUtils.remove ""                   ":"      # ""
    StringUtils.remove "queued"             ""       # "queued"
    StringUtils.remove "queued"             "ue"     # "qd"
    StringUtils.remove "abab::cd:ab:ef::ab" "ab"     # "::cd::ef::"
    StringUtils.remove "queued"             "zz"     # "queued"
 ```

### Stdout
  * The substring with the string removed if found.
### Stderr
  * None.

### Exit codes
  * **0**: When result is displayed.
  * **1**: otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


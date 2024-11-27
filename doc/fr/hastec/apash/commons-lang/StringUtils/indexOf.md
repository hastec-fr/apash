
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# StringUtils.indexOf
Finds the first index of a substring occurence within another string.

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
 | $1     | inString       | string        | in       |            | The string to check.                  |
 | $2     | inResearch     | string        | in       |            | The substring to find within the input string. |

### Example
 ```bash
    StringUtils.indexOf ""         ""   #  0
    StringUtils.indexOf "aabaabaa" ""   #  0
    StringUtils.indexOf "aabaabaa" "b"  #  2
    StringUtils.indexOf "aabaabaa" "ab" #  1
    StringUtils.indexOf "aabaabaa" "mn" # -1
 ```

### Stdout
  * The first index of the search, -1 if no match.
### Stderr
  * None.

### Exit codes
  * **0**: If the index can be displayed.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


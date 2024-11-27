
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# StringUtils.substring
Gets a substring from the specified String.
## Description
   Gets a substring from the specified String. The first character correspond
   to the index 0. Negative index are possible, in this case, it counts from the end.
   Any index minus 0 will be considered as 0 and any index over the length of the string
   will be considered as the length of the string.

## History
### Since
  * 0.1.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default     | Description                           |
 |--------|----------------|---------------|----------|-------------|---------------------------------------|
 | $1     | inString       | string        | in       |             | The String to get the substring from. |
 | $2 ?   | inPrefix       | string        | in       | 0           | The position to start from, negative means count back from the end of the String by this many characters. |
 | $3 ?   | inPrefix       | string        | in       | ${#inString}| The position to end at (exclusive), negative means count back from the end of the String by this many characters. |

### Example
 ```bash
    StringUtils.substring ""              # return ""
    StringUtils.substring "abc"  0   2    # return "ab"
    StringUtils.substring "abc" -2  -1    # return "b"
    StringUtils.substring "abc" -4   2    # return "ab"
    StringUtils.substring "abc"  2   6    # return "c"
 ```

### Stdout
  * substring from start position to end position, empty if empty String input.
### Stderr
  * None.

### Exit codes
  * **0**: If the string can be displayed.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


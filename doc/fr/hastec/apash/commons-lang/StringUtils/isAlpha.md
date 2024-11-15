
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# StringUtils.isAlpha
Checks if the input string contains only Unicode letters.
## Description
   An empty string will return false.

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

### Example
 ```bash
    StringUtils.isAlpha ""            # false
    StringUtils.isAlpha "     "       # false
    StringUtils.isAlpha "abc"         # true
    StringUtils.isAlpha "ab2c"        # false
    StringUtils.isAlpha "ab-c"        # false
    StringUtils.isAlpha "abéc"        # true
 ```

### Stdout
  * None.
### Stderr
  * None

### Exit codes
  * **0**: If the input string contains only unicode letters
  * **1**: contains other things than letters.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


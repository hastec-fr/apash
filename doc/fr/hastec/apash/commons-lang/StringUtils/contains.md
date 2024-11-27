
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# StringUtils.contains
Checks if the CharSequence contains certain characters.
## Description
   An empty sequence of character to search returns always true.

## History
### Since
  * 0.2.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                           |
 |--------|----------------|---------------|----------|------------|---------------------------------------|
 | $1     | inString       | string        | in       |            | The string to check.                  |
 | $2     | inSequence     | string        | in       |            | The sequence of characters to search. |

### Example
 ```bash
    StringUtils.constainsOnly ""      ""      # true
    StringUtils.constainsOnly ""      "ab"    # false
    StringUtils.constainsOnly "abc"   ""      # true
    StringUtils.constainsOnly "abc"   "abc"   # true
    StringUtils.constainsOnly "ab"    "abc"   # false
    StringUtils.constainsOnly "ab1"   "abc"   # false
    StringUtils.constainsOnly "abcde" "bcd"   # true
    StringUtils.constainsOnly "abcde" "a*bc"  # false
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: True if the input string contains only provided characters.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# StringUtils.containsOnly
Checks if the CharSequence contains only certain characters.
## Description
   Checks if the CharSequence contains only certain characters.
   An empty input string returns always true.
   An empty sequence of character to search with a non empty input 
   string returns false.

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
 | $2     | inSequence     | string        | in       |            | The sequence of characters which should compose the input string. |

### Example
 ```bash
    StringUtils.constainsOnly ""     ""     # true
    StringUtils.constainsOnly ""     "ab"   # true
    StringUtils.constainsOnly "ab"   ""     # false
    StringUtils.constainsOnly "abab" "abc"  # true
    StringUtils.constainsOnly "ab1"  "abc"  # false
    StringUtils.constainsOnly "abz"  "abc"  # false
 ```

### Stdout
  * None.
### Stderr
  * None

### Exit codes
  * **0**: True if the input string contains only provided characters.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


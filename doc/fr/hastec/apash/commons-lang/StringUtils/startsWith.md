
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# StringUtils.startsWith
Check if a CharSequence starts with a specified prefix.
## Description
   The prefix is a string (not a pattern).

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
 | $2     | inPrefix       | string        | in       |            | The prefix to find.                   |

### Example
 ```bash
    StringUtils.startsWith "" ""         # true
    StringUtils.startsWith "abcd" ""     # true
    StringUtils.startsWith "abcd" "ab"   # true
    StringUtils.startsWith "abcd" "abd"  # false
    StringUtils.startsWith ""     "a"    # false
    StringUtils.startsWith "abcd" "a.c"  # false
    StringUtils.startsWith "a.cd" "a.c"  # true
 ```

#### Implementation notes
   In zsh, pattern chararecters are interpreted even if they are between quotes.

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: If the string starts with the prefix.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


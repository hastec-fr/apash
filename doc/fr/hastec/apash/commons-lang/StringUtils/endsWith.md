
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# StringUtils.endsWith
Check if a string ends with a specified suffix.
## Description
   The suffix is a string (not a pattern).

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
 | $1     | inString       | string        | in       |            | Input string to check.                |
 | $2     | inSuffix       | string        | in       |            | The suffix to find.                   |

### Example
 ```bash
    StringUtils.endsWith "" ""             # true
    StringUtils.endsWith "abcd"     ""     # true
    StringUtils.endsWith "abcd"     "cd"   # true
    StringUtils.endsWith "abcd"     "bd"   # false
    StringUtils.endsWith ""         "c"    # false
    StringUtils.endsWith "apash"    ".sh"  # false
    StringUtils.endsWith "apash.sh" ".sh"  # false
 ```

#### Implementation notes
   In zsh, pattern chararecters are interpreted even if they are between quotes.

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: If the string ends with the suffix.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# StringUtils.equals
Compares two string, returning true if they represent equal sequences of characters.

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
 | $1     | inString1      | string        | in       |            | First string to compare.              |
 | $2     | inString2      | string        | in       |            | Second string to compare.             |

### Example
 ```bash
    StringUtils.equals "" ""        # true
    StringUtils.equals "abc" "abc"  # true
    StringUtils.equals "abc" "abcd" # false
 ```

### Stdout
  * None.
### Stderr
  * None

### Exit codes
  * **0**: If the string are equal (case-sensitive), or both empty.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


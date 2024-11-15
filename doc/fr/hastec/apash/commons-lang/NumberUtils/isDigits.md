
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# NumberUtils.isDigits
Checks whether the String contains only digit characters.
## Description
   So numbers with "-" and "." will return false.
   Because these character are not digits.

## History
### Since
  * 0.1.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [NumberUtils](../NumberUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                           |
 |--------|----------------|---------------|----------|------------|---------------------------------------|
 | $1     | inNumber       | number        | in       |            | The number to check.                  |

### Example
 ```bash
    NumberUtils.isDigits ""      # false
    NumberUtils.isDigits "a"     # false
    NumberUtils.isDigits "a12"   # false
    NumberUtils.isDigits "-12"   # true
    NumberUtils.isDigits "1.2"   # false
    NumberUtils.isDigits " 12"   # false
    NumberUtils.isDigits "123"   # true
    NumberUtils.isDigits "000"   # true
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the input string has only digits.
  * **1**: When the input string contains characters other than digits.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


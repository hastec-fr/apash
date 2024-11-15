
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# NumberUtils.isInteger
Checks whether the String contains has the form of a valid integer.
## Description
   So numbers with and "." will return false. Only numbers with 
   optional minus first and digits after are considered as valid.

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
    NumberUtils.isInteger ""             # false
    NumberUtils.isInteger "a"            # false
    NumberUtils.isInteger "a12"          # false
    NumberUtils.isInteger "-12"          # true
    NumberUtils.isInteger "--12"         # false
    NumberUtils.isInteger "1-2"          # false
    NumberUtils.isInteger "1.2"          # false
    NumberUtils.isInteger " 12"          # false
    NumberUtils.isInteger "123"          # true
    NumberUtils.isInteger "000"          # true
    NumberUtils.isInteger "2147483647"   # true
    NumberUtils.isInteger "-2147483648"  # true
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the input string is an integer.
  * **1**: When the input string contains characters other than digits and a minus before, or is out of bound from 32bits Integer.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


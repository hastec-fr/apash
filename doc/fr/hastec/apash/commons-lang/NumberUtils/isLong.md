
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# NumberUtils.isLong
Checks whether the String contains has the form of a valid long integer.
## Description
   Numbers with and "." will return false. Only numbers with 
   optional minus first and digits after are considered as valid.

## History
### Since
  * 0.2.0 (hastec-fr)

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
    NumberUtils.isLong ""                      # false
    NumberUtils.isLong "a"                     # false
    NumberUtils.isLong "a12"                   # false
    NumberUtils.isLong "-12"                   # true
    NumberUtils.isLong "--12"                  # false
    NumberUtils.isLong "1-2"                   # false
    NumberUtils.isLong "1.2"                   # false
    NumberUtils.isLong " 12"                   # false
    NumberUtils.isLong "123"                   # true
    NumberUtils.isLong "000"                   # true
    NumberUtils.isLong "-9223372036854775808"  # true
    NumberUtils.isLong "9223372036854775807"   # true
    NumberUtils.isLong "9223372036854775808"   # false
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the input string is a long integer.
  * **1**: When the input string contains characters other than digits and a minus before, or is out of bound from 64bits integer.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


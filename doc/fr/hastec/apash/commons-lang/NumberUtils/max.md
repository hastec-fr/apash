
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# NumberUtils.max
Returns the greater value of a list of numbers.
## Description
   If the arguments have the same value, the result is that same value
   but the first number format is returned.

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
 | ${@:1} | inNumbers      | number...     | in       |            | List of number to evaluate.           |

### Example
 ```bash
    NumberUtils.max  ""       ""       ""       # failure - ""
    NumberUtils.max  "a"      "1"      "2"      # failure - ""
    NumberUtils.max  "0"      "1"      ""       # failure - ""
    NumberUtils.max  "0"      "2"      "1"      # 2
    NumberUtils.max  "2"      "-3"     "0"      # 2
    NumberUtils.max  "-2"     "-3"     "-4"     # -2
    NumberUtils.max  "0.123"  ".099"   "-1"     # 0.123
    NumberUtils.max  "-.123"  "0.123"  ".123"   # 0.123
    NumberUtils.max  "000"    "0"      "00"     # 000
 ```

### Stdout
  * Returns the greater value from a list of number.
         In case of equality, the first number format is returned.
### Stderr
  * None.

### Exit codes
  * **0**: When all inputs are parsable numbers.
  * **1**: When at least one input is not a parsable.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


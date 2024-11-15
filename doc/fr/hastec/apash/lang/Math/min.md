
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# Math.min
Returns the smaller of two number values.
## Description
   If the arguments have the same value, the result is that same value,
   The last input value format is returned.

## History
### Since
  * 0.2.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [lang](../../lang.md) / [Math](../Math.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                           |
 |--------|----------------|---------------|----------|------------|---------------------------------------|
 | $1     | inNum1         | number        | in       |            | The first number to compare.          |
 | $2     | inNum2         | number        | in       |            | The second number to compare.         |

### Example
 ```bash
    Math.min  ""       ""       # failure - ""
    Math.min  "a"      "1"      # failure - ""
    Math.min  "0"      "1"      # 0
    Math.min  "2"      "103"    # 2
    Math.min  "1"      "-1"     # -1
    Math.min  "-2"     "-3"     # -3
    Math.min  "0.123"  ".099"   # 0.099
    Math.min  "-.123"  "0.123"  # -.123
    Math.min  "000"    "0"      # 000
 ```

### Stdout
  * Returns the smaller of two number values.
         In case of equality, the last number format is returned.
### Stderr
  * None.

### Exit codes
  * **0**: When the input strings is a parsable number.
  * **1**: When the input strings are not parsable.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


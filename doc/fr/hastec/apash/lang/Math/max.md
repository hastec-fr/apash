
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# Math.max
Returns the greater of two number values.
## Description
   If the arguments have the same value, the result is that same value
   but the first number format is returned.

## History
### Since
  * 0.1.0 (hastec-fr)

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
    Math.max  ""       ""       # failure - ""
    Math.max  "a"      "1"      # failure - ""
    Math.max  "0"      "1"      # 1
    Math.max  "2"      "103"    # 103
    Math.max  "1"      "-1"     # 1
    Math.max  "-2"     "-3"     # -2
    Math.max  "0.123"  ".099"   # 0.123
    Math.max  "-.123"  "0.123"  # -0.123
    Math.max  "000"    "0"      # 000
 ```

### Stdout
  * Returns the greater value of two number.
         In case of equality, the first number format is returned.
### Stderr
  * None.

### Exit codes
  * **0**: When the input strings is a parsable number.
  * **1**: When the input strings are not parsable.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# NumberUtils.isParsable
Checks whether the given String is a parsable number.
## Description
   Parsable numbers include those Strings having potential minus in front,
   only digits and a potential ".". Hexadecimal and scientific notations are not considered parsable

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
    NumberUtils.isParsable  ""       # false
    NumberUtils.isParsable  "a"      # false
    NumberUtils.isParsable  "a12"    # false
    NumberUtils.isParsable  "-12"    # true
    NumberUtils.isParsable  "--12"   # false
    NumberUtils.isParsable  "1-2"    # false
    NumberUtils.isParsable  "1.2"    # true
    NumberUtils.isParsable  " 12"    # false
    NumberUtils.isParsable  "123"    # true
    NumberUtils.isParsable  "000"    # true
    NumberUtils.isParsable  "1."     # false
    NumberUtils.isParsable  ".1"     # true
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the input string is a parsable number.
  * **1**: When the input string contains characters other than digits and a minus before and a potential dot with meaning numbers.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


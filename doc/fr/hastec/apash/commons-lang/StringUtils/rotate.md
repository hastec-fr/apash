
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.rotate

Rotate (circular shift) a string of shift characters

## Overview

* If shift > 0, right circular shift (ex : ABCDEF => FABCDE)
* If shift < 0, left circular shift (ex : ABCDEF => BCDEFA)
* Empty shift are considered as 0

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.rotate](#stringutilsrotate)

### StringUtils.rotate

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | inString       | string        | in       |            | The string to rotate.                 |
| $2 ?   | inNbChars      | number        | in       | 0          | Number of time to shift.              |

#### Example

```bash
StringUtils.rotate ""          ""      # ""
StringUtils.rotate "abcdefg"   "0"     # "abcdefg"
StringUtils.rotate "abcdefg"   "2"     # "fgabcde"
StringUtils.rotate "abcdefg"   "-2"    # "cdefgab"
StringUtils.rotate "abcdefg"   "7"     # "abcdefg"
StringUtils.rotate "abcdefg"   "-7"    # "abcdefg"
StringUtils.rotate "abcdefg"   "9"     # "fgabcde"
StringUtils.rotate "abcdefg"   "-9"    # "cdefgab"
```

#### Exit codes

* **0**: When result is displayed.
* **1**: When the shift is not a valid number.

#### Output on stdout

* The rotated String, or the original String if shift == 0 or the input string is empty.
  An empty string if the shift is not a valid number.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


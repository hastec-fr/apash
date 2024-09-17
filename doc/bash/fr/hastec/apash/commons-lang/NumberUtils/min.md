
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# NumberUtils.min

Returns the smaller value of a list of numbers.

## Overview

If the arguments have the same value, the result is that same value
but the first number format is returned.
### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [NumberUtils](../NumberUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [NumberUtils.min](#numberutilsmin)

### NumberUtils.min

#### Example

```bash
NumberUtils.min  ""       ""       ""       # failure - ""
NumberUtils.min  "a"      "1"      "2"      # failure - ""
NumberUtils.min  "0"      "1"      ""       # failure - ""
NumberUtils.min  "0"      "2"      "1"      # 0
NumberUtils.min  "2"      "-3"     "0"      # -3
NumberUtils.min  "-2"     "-3"     "-4"     # -4
NumberUtils.min  "0.123"  ".099"   "-1"     # -1
NumberUtils.min  "-.123"  "-0.123"  ".123"  # -.123
NumberUtils.min  "000"    "0"      "00"     # 000
```

#### Arguments

* **$1** (string...): List of number to evaluate.

#### Exit codes

* **0**: When all inputs are parsable numbers.
* **1**: When at least one input is not a parsable.

#### Output on stdout

* Returns the greater value from a list of numbers.
  In case of equality, the first number format is returned.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


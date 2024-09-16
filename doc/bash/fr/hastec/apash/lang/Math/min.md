
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# Math.min

Returns the smaller of two number values.

## Overview

If the arguments have the same value, the result is that same value,
The last input value format is returned.
### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [lang](../../lang.md) / [Math](../Math.md) / 
<!-- apash.parentEnd -->

## Index

* [Math.min](#mathmin)

### Math.min

#### Example

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

#### Arguments

* **$1** (number): The first number to compare.
* **$2** (number): The second number to compare.

#### Exit codes

* **0**: When the input strings is a parsable number.
* **1**: When the input strings are not parsable.

#### Output on stdout

* Returns the smaller of two number values.
  In case of equality, the last number format is returned.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


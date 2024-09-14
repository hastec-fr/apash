
<div align="center" id="apash-top">
  <a href="https://github.com/hastec-fr/apash">
    <img alt="apash-logo" src="../../../../../../../assets/apash-logo.svg"/>
  </a>

  # Apash
</div>

# Math.max

Returns the greater of two number values.

## Overview

If the arguments have the same value, the result is that same value
but the first number format is returned. Multiple 000 are reduced to 0.
### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [lang](../../lang.md) / [Math](../Math.md) / 
<!-- apash.parentEnd -->

## Index

* [Math.max](#mathmax)

### Math.max

#### Example

```bash
Math.max  ""       ""       # failure - ""
Math.max  "a"      "1"      # failure - ""
Math.max  "0"      "1"      # 1
Math.max  "2"      "103"    # 103
Math.max  "1"      "-1"     # 1
Math.max  "-2"     "-3"     # -2
Math.max  "0.123"  ".099"   # 0.123
Math.max  "-.123"  "0.123"  # -0.123
Math.max  "000"    "0"      # 0
```

#### Arguments

* **$1** (number): The first number to compare.
* **$2** (number): The second number to compare.

#### Exit codes

* **0**: When the input strings is a parsable number.
* **1**: When the input strings are not parsable.

#### Output on stdout

* Returns the smaller of two number values.
  In case of equality, the first number format is returned.
  Multiple 000 are reduced to 0.

#### Output on stderr

* None.


  <div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>


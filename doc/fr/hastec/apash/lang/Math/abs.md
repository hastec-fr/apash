
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# Math.abs

Checks whether the given String is a parsable number, then return without minus sign (absolute value).

## Overview

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [lang](../../lang.md) / [Math](../Math.md) / 
<!-- apash.parentEnd -->

## Index

* [Math.abs](#mathabs)

### Math.abs

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | inNumber       | number        | in       |            | The number to evaluate.               |

#### Example

```bash
Math.abs  ""       # failure - ""
Math.abs  "a"      # failure - ""
Math.abs  "a12"    # failure - ""
Math.abs  "-12"    # 12
Math.abs  "--12"   # failure - ""
Math.abs  "1-2"    # false
Math.abs  "1.2"    # 1.2
Math.abs  " 12"    # failure - ""
Math.abs  "123"    # 123
Math.abs  "000"    # 000
Math.abs  "1."     # failure - ""
Math.abs  ".1"     # .1
Math.abs  "-.12"   # .12
```

#### Exit codes

* **0**: When the input string is a parsable number.
* **1**: When the input string contains characters other than digits and a minus before

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


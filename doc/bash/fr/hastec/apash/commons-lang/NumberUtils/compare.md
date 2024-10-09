
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# NumberUtils.compare

Compares to values numerically (substration)

## Overview

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [NumberUtils](../NumberUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [NumberUtils.compare](#numberutilscompare)

### NumberUtils.compare

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | inNumber1      | number        | in       |            | The first number to compare.          |
| $2     | inNumber2      | number        | in       |            | The second number to compare.         |

#### Example

```bash
NumberUtils.compare "" ""     # failure - ""
NumberUtils.compare "0" ""    # failure - ""
NumberUtils.compare "1" "1"   # 0
NumberUtils.compare "0" "2"   # -2
NumberUtils.compare "2" "0"   # 2
NumberUtils.compare "1.2" "1" # failure - ""
```

#### Exit codes

* **0**: When inputs are integers.
* **1**: When inputs are not integers.

#### Output on stdout

* the value 0 if $1 == $2; a value less than 0 if $1 < $2; and a value greater than 0 if $1 > $2.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


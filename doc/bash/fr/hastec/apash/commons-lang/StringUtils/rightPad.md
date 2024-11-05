
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.rightPad

Right pad a string with a specified string.

## Overview

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.rightPad](#stringutilsrightpad)

### StringUtils.rightPad

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | inString       | string        | in       |            | The string to pad out.                |
| $2     | inSize         | number        | in       |            | The size to pad to.                   |
| $3 ?   | inReplacement  | string        | in       | " "        | The string to pad with, empty treated as single space (default). |

#### Example

```bash
StringUtils.rightPad ""     ""    ""      # failure - ""
StringUtils.rightPad ""     "3"   "z"     # "zzz"
StringUtils.rightPad "bat"  "3"   "yz"    # "bat"
StringUtils.rightPad "bat"  "5"   "yz"    # "batyz"
StringUtils.rightPad "bat"  "8"   "yz"    # "batyzyzy"
StringUtils.rightPad "bat"  "-1"  "z"     # "bat"
StringUtils.rightPad "bat"  "5"   ""      # "bat   "
```

#### Exit codes

* **0**: When result is displayed.
* **1**: When the size is not a positive numeric or the result cannot be displayed.

#### Output on stdout

* Right padded string or original string if no padding is necessary.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


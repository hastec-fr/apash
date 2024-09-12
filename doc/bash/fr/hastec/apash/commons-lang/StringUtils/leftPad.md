
<div align="center" id="apash-top">
  <a href="https://github.com/hastec-fr/apash">
    <img alt="apash-logo" src="../../../../../../../assets/apash-logo.svg"/>
  </a>

  # Apash
</div>

# StringUtils.leftPad

Left pad a String with a specified String.

## Overview

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.leftPad](#stringutilsleftpad)

### StringUtils.leftPad

#### Example

```bash
StringUtils.leftPad ""     ""    ""      # failure - ""
StringUtils.leftPad ""     "3"   "z"     # "zzz"
StringUtils.leftPad "bat"  "3"   "yz"    # "bat"
StringUtils.leftPad "bat"  "5"   "yz"    # "yzbat"
StringUtils.leftPad "bat"  "8"   "yz"    # "yzyzybat"
StringUtils.leftPad "bat"  "-1"  "z"     # "bat"
StringUtils.leftPad "bat"  "5"   ""      # "  bat"
```

#### Arguments

* **$1** (string): The string to pad out.
* **$2** (string): The size to pad to.
* **$3** (string): The string to pad with, empty treated as single space (default).

#### Exit codes

* **0**: When result is displayed.
* **1**: When the size is not a positive numeric or the result cannot be displayed.

#### Output on stdout

* Left padded string or original string if no padding is necessary.

#### Output on stderr

* None.


  <div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>


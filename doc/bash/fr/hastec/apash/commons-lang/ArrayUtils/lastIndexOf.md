
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.lastIndexOf

Finds the last index of the given value in the array starting at the given index.

## Overview

A negative startIndex is treated as zero. A startIndex larger than the array length will return an empty
### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.lastIndexOf](#arrayutilslastindexof)

### ArrayUtils.lastIndexOf

#### Example

```bash
myIndexes=()
ArrayUtils.lastIndexOf  ""       ""         # failure - ""
ArrayUtils.lastIndexOf  "myVar"  "a"        # failure - ""
```

#### Arguments

* **$1** (ref(string[])): Name of the array to check.
* **$2** (string): Value to find.
* **$3** (number): (Optional) The index to start searching at [Default=0].

#### Exit codes

* **0**: When input array references exist and start index is an integer (when declared).
* **1**: Otherwise.

#### Output on stdout

* The last index of the value within the array, ArrayUtils_INDEX_NOT_FOUND (-1) if not found.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


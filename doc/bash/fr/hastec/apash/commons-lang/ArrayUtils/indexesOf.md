
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.indexesOf

Finds the indices of the given value in the array starting at the given index.

## Overview

A negative startIndex is treated as zero. A startIndex larger than the array length will return an empty
### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.indexesOf](#arrayutilsindexesof)

### ArrayUtils.indexesOf

#### Example

```bash
myIndexes=()
ArrayUtils.indexesOf "myIndexes" ""       ""     # failure - ()
ArrayUtils.indexesOf "myIndexes" "myVar"  "a"    # failure - ()
```

#### Arguments

* **$1** (ref(number[])): Name of the output array getting result indexes.
* **$2** (ref(string[])): Name of the array to check.
* **$3** (string): Value to find.
* **$4** (number): The index to start searching at.

#### Exit codes

* **0**: When input array references exist.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


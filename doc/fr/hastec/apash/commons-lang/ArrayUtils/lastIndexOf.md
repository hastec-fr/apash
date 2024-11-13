
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.lastIndexOf

Finds the last index of the given value in the array starting at the given index.

## Overview

A negative startIndex is treated as zero. A startIndex larger than the array length will return an empty

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.lastIndexOf](#arrayutilslastindexof)

### ArrayUtils.lastIndexOf

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                          |
|--------|----------------|---------------|----------|------------|--------------------------------------|
| $1     | inArrayName    | ref(string[]) | in       |            |  Name of the array to check.         |
| $2     | inValue        | string        | in       |            |  Value to find.                      |
| $3 ?   | inStart        | number        | in       | 0          |  The index to start searching at .   |

#### Example
```bash
myIndexes=()
ArrayUtils.lastIndexOf  ""       ""         # failure - ""
ArrayUtils.lastIndexOf  "myVar"  "a"        # failure - ""

declare -A myMap
ArrayUtils.lastIndexOf  "myMap"  "a"        # failure - ""

myArray=("a" "b" "" "c" "b")
ArrayUtils.lastIndexOf  "myArray" "b"       # ("4")
ArrayUtils.lastIndexOf  "myArray" ""        # ("2")
ArrayUtils.lastIndexOf  "myArray"           # failure - ""

myIndexes=(1 2)
myArray=("a" "b")
ArrayUtils.lastIndexOf  "myArray" "c"       # -1
ArrayUtils.lastIndexOf  "myArray" "a" "3"   # -1
ArrayUtils.lastIndexOf  "myArray" "a" "-1"  # 0
ArrayUtils.lastIndexOf  "myArray" ""        # -1
```

#### Exit codes

* **0**: When input array references exist and start index is an integer (when declared).
* **1**: Otherwise.

#### Output on stdout

* The last index of the value within the array, ArrayUtils_INDEX_NOT_FOUND (-1) if not found.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


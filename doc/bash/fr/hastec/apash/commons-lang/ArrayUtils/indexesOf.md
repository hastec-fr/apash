
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.indexesOf

Finds the indices of the given value in the array starting at the given index.

## Overview

A negative startIndex is treated as zero. 
A startIndex larger than the array length will return an empty.

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.indexesOf](#arrayutilsindexesof)

### ArrayUtils.indexesOf

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                          |
|--------|----------------|---------------|----------|------------|--------------------------------------|
| $1     | outArrayName   | ref(string[]) | out      |            | Name of the output array storing result indexes.    |
| $2     | inArrayName    | ref(string[]) | in       |            | Name of the array to check.          |
| $3     | inValue        | string        | in       |            | Value to find.                       |
| $4 ?   | inStart        | number        | in       | 0          | The index to start searching at.     |


#### Example
```bash
myIndexes=()
ArrayUtils.indexesOf "myIndexes" ""       ""     # failure - ()
ArrayUtils.indexesOf "myIndexes" "myVar"  "a"    # failure - ()

declare -A myMap
ArrayUtils.indexesOf "myIndexes" "myMap"  "a"    # failure - ()

myArray=("a" "b" "" "c" "b")
ArrayUtils.indexesOf "myIndexes" "myArray" "b"   # ("1" "4")

myIndexes=(1 2)
myArray=("a" "b")
ArrayUtils.indexesOf "myIndexes" "myArray" "c"       # ()
ArrayUtils.indexesOf "myIndexes" "myArray" "a" "3"   # ()
ArrayUtils.indexesOf "myIndexes" "myArray" "a" "-1"  # (0)
```

#### Exit codes

* **0**: When input array references exist.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


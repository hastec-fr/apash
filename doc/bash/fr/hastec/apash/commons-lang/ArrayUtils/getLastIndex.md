
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.getLastIndex

Return the last index of the given array.

## Overview

Empty string is returned if the array is empty.

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.getLastIndex](#arrayutilsgetlastindex)

### ArrayUtils.getLastIndex

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                          |
|--------|----------------|---------------|----------|------------|--------------------------------------|
| $1     | inArrayName    | ref(string[]) | in       |            | Name of the array to check.          |

#### Example
```bash
myIndexes=()
ArrayUtils.getLastIndex  ""               # failure - ""
ArrayUtils.getLastIndex  "myVar"          # failure - ""

declare -A myMap
ArrayUtils.getLastIndex  "myMap"          # failure - ""

myArray=()
ArrayUtils.getLastIndex  "myArray"        # ""

myArray=("a" "b" "" "c" "b")
ArrayUtils.getLastIndex  "myArray"        # 4

myArray[9223372036854775807]=z
ArrayUtils.getLastIndex  "myArray"        # 9223372036854775807

```

#### Exit codes

* **0**: When input array references exist.
* **1**: Otherwise.

#### Output on stdout

* The last index of the array.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


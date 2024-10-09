
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.isSameLastIndex

Checks whether two arrays are the same length, return false if it's not an array.

## Overview

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.isSameLastIndex](#arrayutilsissamelastindex)

### ArrayUtils.isSameLastIndex

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                          |
|--------|----------------|---------------|----------|------------|--------------------------------------|
| $1     | inArrayName1   | ref(string[]) | in       |            | The first array to compare.          |
| $2     | inArrayName2   | ref(string[]) | in       |            | The second array to compare.         |

#### Example
```bash
ArrayUtils.isSameLastIndex ""        ""          # false
ArrayUtils.isSameLastIndex "myVar"   "myVar"     # false

declare -A myMap
ArrayUtils.isSameLastIndex "myMap"    "myMap     # false

myArray=()
ArrayUtils.isSameLastIndex "myArray"  "myArray"  # true
ArrayUtils.isSameLastIndex "myArray"  ""         # false

myArray1=("a")
myArray2=("b")
ArrayUtils.isSameLastIndex "myArray1" "myArray2" # true

myArray1=("a")
myArray2=("a" "b")
ArrayUtils.isSameLastIndex "myArray"  "myArray2" # false

myArray1=("a")
myArray2=("a" "b")
myArray1[10]=z
ArrayUtils.isSameLength "myArray"  "myArray2"    # false
```

#### Exit codes

* **0**: True if length of arrays matches.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.isArrayIndexValid

Returns whether a given array can safely be accessed at the given index.

## Overview

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.isArrayIndexValid](#arrayutilsisarrayindexvalid)

### ArrayUtils.isArrayIndexValid

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                          |
|--------|----------------|---------------|----------|------------|--------------------------------------|
| $1     | inArrayName    | ref(string[]) | in       |            | The array to inspect                 |
| $2     | inIndex        | number        | in       |            | The index of the array to be inspected.  |

#### Example
```bash
ArrayUtils.isArrayIndexValid ""       ""     # false
ArrayUtils.isArrayIndexValid "myVar"  "a"    # false

declare -A myMap
ArrayUtils.isArrayIndexValid "myMap"  "a"    # false

myArray=("a" "b" "" "c" "b")
ArrayUtils.isArrayIndexValid "myArray" "1"                  # true
ArrayUtils.isArrayIndexValid "myArray" "${#myArray}"        # false
ArrayUtils.isArrayIndexValid "myArray" "$((${#myArray}-1))" # true
ArrayUtils.isArrayIndexValid "myArray" "-1"                 # false
ArrayUtils.isArrayIndexValid "myArray" "5"                  # false
ArrayUtils.isArrayIndexValid "myArray"                      # false
```

#### Exit codes

* **0**: Whether the given index is safely-accessible in the given array.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


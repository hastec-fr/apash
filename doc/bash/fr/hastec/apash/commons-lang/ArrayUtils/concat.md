
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.concat

Concatenate multiple arrays

## Overview

The output array can be one of the input array (modified at the end).

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.concat](#arrayutilsconcat)

### ArrayUtils.concat

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                          |
|--------|----------------|---------------|----------|------------|--------------------------------------|
| $1     | outArrayName   | ref(string[]) | out      |            | Name of the array with concatenated values.          |
| ${@:2} | inArrayName*   | ref(string[]) | in       |            | Name of the arrays to concatenate.        |

#### Example
```bash
local outArray=()
myArray1=("a" "b" "c")
myArray2=("d" "e")
myArray2[3]="f"
ArrayUtils.countMathes outArray "myArray1" "myArray2" # ("a" "b" "c" "d" "e" "" "f")
```

#### Exit codes

* **0**: When all arguments are arrays.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


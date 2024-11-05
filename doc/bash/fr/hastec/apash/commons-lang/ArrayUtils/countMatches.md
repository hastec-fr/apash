
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.countMathes

Return the number of cells having the given value

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

* [ArrayUtils.countMatches](#arrayutilscountmatches)

### ArrayUtils.countMatches

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                          |
|--------|----------------|---------------|----------|------------|--------------------------------------|
| $1     | inArrayName    | ref(string[]) | in       |            | Name of the array to check.          |
| $2     | inValue        | string        | in       | ""         | Value to find in the array.          |

#### Example
```bash
myArray=("a" "b" "" "a" "c" "" "")
ArrayUtils.countMathes  "myArray"              # 3
ArrayUtils.countMathes  "myArray"  "d"         # 0
ArrayUtils.countMathes  "myArray"  "b"         # 1
ArrayUtils.countMathes  "myArray"  "a"         # 2
```

#### Exit codes

* **0**: When first argument is an array.
* **1**: Otherwise.

#### Output on stdout

* The number of cells having the given value.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.contains

Adds given elements at the end of an array.

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

* [ArrayUtils.contains](#arrayutilscontains)

### ArrayUtils.contains

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                          |
|--------|----------------|---------------|----------|------------|--------------------------------------|
| $1     | inArrayName    | ref(string[]) | in       |            | Name of the array to check.          |
| $2     | inValue        | string        | in       |            | Value to find in the array.          |

#### Example
```bash
ArrayUtils.contains  ""       ""            # false
ArrayUtils.contains  "myVar"  "a"           # false

declare -A myMap
ArrayUtils.contains  "myMap"  "a"           # false

myArray=("a" "b" "" "c")
ArrayUtils.contains  "myArray"              # false
ArrayUtils.contains  "myArray"  "d"         # false
ArrayUtils.contains  "myArray"  ""          # true
ArrayUtils.contains  "myArray"  "b"         # true
ArrayUtils.contains  "myArray"  "a b"       # false
```

#### Exit codes

* **0**: When first argument is an array and a value to find is provided.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


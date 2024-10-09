
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.isSorted

This method checks whether the provided array is sorted according to natural ordering.

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

* [ArrayUtils.isSorted](#arrayutilsissorted)

### ArrayUtils.isSorted

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                          |
|--------|----------------|---------------|----------|------------|--------------------------------------|
| $1     | inArrayName    | ref(string[]) | in       |            | Name of the array to check.          |

#### Example
```bash
ArrayUtils.isSorted ""         # false
ArrayUtils.isSorted "myVar"    # false

declare -A myMap
ArrayUtils.isSorted "myMap"    # false

myArray=()
ArrayUtils.isSorted "myArray"  # true

myArray=("a" "b" "c")
ArrayUtils.isSorted "myArray"  # true

myArray=("a" "c" "b")
ArrayUtils.isSorted "myArray"  # false

myArray=("beta-1" "beta-10" "beta-20")
ArrayUtils.isSorted "myArray"  # true

myArray=("1" "a")
ArrayUtils.isSorted "myArray"  # true

myArray=("" "1")
ArrayUtils.isSorted "myArray"  # true
```

#### Exit codes

* **0**: True Whether the array is sorted according to natural ordering.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


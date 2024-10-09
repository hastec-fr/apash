
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.clone

Copy an array into another array using references.

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

* [ArrayUtils.clone](#arrayutilsclone)

### ArrayUtils.clone

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                          |
|--------|----------------|---------------|----------|------------|--------------------------------------|
| $1     | inArrayName    | ref(string[]) | in       |            | Name of the array to clone.          |
| $2     | outArrayName   | ref(string[]) | out      |            | Name of the array which will receive the clone.|

#### Example
```bash
ArrayUtils.clone  ""       ""               # failure

declare -A myMap
ArrayUtils.addFirst  "myMap"  "a"           # failure

declare -a myClone
ArrayUtils.clone  "myVar"  "myClone"        # failure

myArray=()
myClone=("a")
ArrayUtils.clone     "myArray"  "myClone"   # myClone=()

myArray=("a" "b" "" "c")
myClone=("d" "e" "f")
ArrayUtils.clone     "myArray"  "myClone"   # myClone=("a" "b" "" "c")

myArray=("a" "b" "" "c")
myClone=()
ArrayUtils.clone     "myArray"  "myClone"   # myClone=("a" "b" "" "c")
```

#### Exit codes

* **0**: When input arguments are arrays.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.isSameLength

Checks whether two arrays are the same length, return false if it's not an array.

## Overview

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.isSameLength](#arrayutilsissamelength)

### ArrayUtils.isSameLength

#### Example
```bash
ArrayUtils.isSameLength ""        ""         # false
ArrayUtils.isSameLength "myVar"   "myVar"    # false

declare -A myMap
ArrayUtils.isSameLength "myMap"    "myMap    # false

myArray=()
ArrayUtils.isSameLength "myArray"  "myArray" # true
ArrayUtils.isSameLength "myArray"  ""        # false

myArray1=("a")
myArray2=("b")
ArrayUtils.isSameLength "myArray1" "myArray2" # true

myArray1=("a")
myArray2=("a" "b")
ArrayUtils.isSameLength "myArray"  "myArray2" # false
```

#### Arguments

* **$1** (ref(string[])): The first array to compare.
* **$2** (ref(string[])): The second array to compare.

#### Exit codes

* **0**: True if length of arrays matches.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


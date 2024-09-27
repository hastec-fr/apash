
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.nullToEmpty

Defensive programming technique to change a null reference to an empty Array

## Overview

The reference is transformed in any case in empty array.
Use the mathematic expression which accept dynamic name on left assignement 
to do the trick without using eval. Then flush the array.

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.nullToEmpty](#arrayutilsnulltoempty)

### ArrayUtils.nullToEmpty

#### Example
```bash
ArrayUtils.nullToEmpty  ""                # failure
ArrayUtils.nullToEmpty  "myVar"           # myVar=()

declare -A myMap
ArrayUtils.nullToEmpty  "myMap"           # myVar=()

myArray=()
ArrayUtils.nullToEmpty  "myArray"         # myArray()

myArray=("a" "b" "c")
ArrayUtils.nullToEmpty  "myArray"  "a"    # myArray=("a" "b" "c")
```

#### Arguments

* **$1** (ref(string[])): Name of the array if exists.

#### Exit codes

* **0**: When the array is created.
* **1**: Otherwise.

#### Output on stdout

* None

#### Output on stderr

* None.

#### See also

* [For adding element in the middle of an array, please check insert method.](#for-adding-element-in-the-middle-of-an-array-please-check-insert-method)


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


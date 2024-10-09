
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.removeElement

Removes the first occurrence of the specified element from the specified array.

## Overview

All subsequent elements are shifted to the left (subtracts one from their indices). 
If the array doesn't contains such an element, no elements are removed from the array.

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.removeElement](#arrayutilsremoveelement)

### ArrayUtils.removeElement

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                          |
|--------|----------------|---------------|----------|------------|--------------------------------------|
| $1     | ioArrayName    | ref(string[]) | in       |            |  Name of the array to modify.        |
| $2     | inValue        | string        | in       |            |  The first occurence of the value to remove from the array.  |

#### Example
```bash
myArray=("a" "b" "a" "c" "" "d")
ArrayUtils.removeElement  "myArray"            # failure
ArrayUtils.removeElement  "myArray"  "a"       # ("b" "a" "c" "" "d")
ArrayUtils.removeElement  "myArray"  "a"       # ("b" "c" "" "d")
ArrayUtils.removeElement  "myArray"  ""        # ("b" "c" "d")
ArrayUtils.removeElement  "myArray"  "e"       # ("b" "c" "d")

myArray=("a")
ArrayUtils.removeElement  "myArray"  "a"       # ()
ArrayUtils.removeElement  "myArray"  "a"       # ()
```

#### Exit codes

* **0**: When the first occurence is removed from the array.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


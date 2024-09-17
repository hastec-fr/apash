
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

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.removeElement](#arrayutilsremoveelement)

### ArrayUtils.removeElement

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

#### Arguments

* **$1** (ref(string[])): Name of the array to modify.
* **$2** (string): The first occurence of the value to remove from the array.

#### Exit codes

* **0**: When the first occurence is removed from the array.
* **1**: Otherwise.

#### Output on stdout

* None

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


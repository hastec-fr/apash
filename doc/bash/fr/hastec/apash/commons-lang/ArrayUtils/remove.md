
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.remove

Removes the element at the specified position from the specified array.

## Overview

All subsequent elements are shifted to the left (subtracts one from their indices).

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.remove](#arrayutilsremove)

### ArrayUtils.remove

#### Example
```bash
ArrayUtils.remove  ""       ""          # failure
ArrayUtils.remove  "myVar"  "a"         # failure

declare -A myMap
ArrayUtils.remove  "myMap"  "a"         # failure

myArray=("a" "b" "c" "" "d")
ArrayUtils.remove  "myArray"            # failure
ArrayUtils.remove  "myArray"  "4"       # ("a" "b" "c" "")
ArrayUtils.remove  "myArray"  "2"       # ("a" "b" "")
ArrayUtils.remove  "myArray"  "0"       # ("b" "")
ArrayUtils.remove  "myArray"  "-1"      # failure - ("b" "")

myArray=("a")
ArrayUtils.remove  "myArray"  "4"       # failure - (a)
ArrayUtils.remove  "myArray"  "0"       # ()
ArrayUtils.remove  "myArray"  "0"       # failure - ()
```

#### Arguments

* **$1** (ref(string[])): Name of the array to modify.
* **$2** (number): The index of the array to remove.

#### Exit codes

* **0**: When first argument is an array and the index is valid.
* **1**: Otherwise.

#### Output on stdout

* None

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.addAll

Adds given elements at the end of an array.

## Overview

Non array reference will be transformed to empty array.

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.addAll](#arrayutilsaddall)

### ArrayUtils.addAll

#### Example
```bash
ArrayUtils.addAll  ""       ""            # failure
ArrayUtils.addAll  "myVar"  "a"           # ("a")

declare -A myMap
ArrayUtils.addAll  "myMap"  "a"           # ("a")

myArray=()
ArrayUtils.addAll  "myArray"              # failure
ArrayUtils.addAll  "myArray"  "a"         # ("a")
ArrayUtils.addAll  "myArray"  "b" ""      # ("a" "b" "")
ArrayUtils.addAll  "myArray"  "c" "d"     # ("a" "b" "" "c" "d")
ArrayUtils.addAll  "myArray"  "foo bar"   # ("a" "b" "" "c" "d" "foo bar")
```

#### Arguments

* **$1** (ref(string[])): Name of the array to modify.
* **$2** (string...): Values to add at the end of the array.

#### Exit codes

* **0**: When first argument is an array and at least one value is provided.
* **1**: Otherwise.

#### Output on stdout

* None

#### Output on stderr

* None.

#### See also

* [For adding element in the middle of an array, please check insert method.](#for-adding-element-in-the-middle-of-an-array-please-check-insert-method)


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.shift

Shifts the order of a series of elements in the given array.

## Overview

This method does nothing for non existing array.

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.shift](#arrayutilsshift)

### ArrayUtils.shift

#### Example
```bash
myArray=("a" "b" "c" "" "d")
ArrayUtils.shift    "myArray"                    # ("a" "b" "c" "" "d")
ArrayUtils.shift    "myArray"  "2"               # ("" "d" "a" "b" "c")

myArray=("a" "b" "c" "" "d")
ArrayUtils.shift    "myArray"  "${#myArray[@]}"  # ("a" "b" "c" "" "d")

myArray=("a" "b" "c" "" "d")
ArrayUtils.shift    "myArray"  "1" "3"           # ("a" "b" "c" "d" "")

myArray=("a" "b" "c" "" "d")
ArrayUtils.shift    "myArray"  "1" "1" "3"       # ("a" "" "b" "c" "d")

myArray=("a" "b" "c" "" "d")
ArrayUtils.shift    "myArray"  "-1"              # ("b" "c" "" "d" "a")

```

#### Arguments

* **$1** (ref(string[])): Name of the array to shift.
* **$2** (number): The number of positions to rotate the elements. If the offset is larger than the number of elements to rotate, than the effective offset is modulo the number of elements to rotate. [Default:0]
* **$3** (number): The starting inclusive index for reversing. Undervalue (<0) is promoted to 0, overvalue (>array.length) results in no change. [Default:0]
* **$4** (number): The ending exclusive index (up to endIndex-1) for reversing. Undervalue (< start index) results in no change. Overvalue (>array.length) is demoted to array length. [Default: ${#Array.length}]

#### Exit codes

* **0**: When the array is shifted.
* **1**: When the input is not an array or the offset/indexes are not integers.

#### Output on stdout

* None.

#### Output on stderr

* None.

#### See also

* [https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/ArrayUtils.html#line.6959](https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/ArrayUtils.html#line.6959)


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


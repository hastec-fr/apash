
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.swap

Swaps a series of elements in the given array.

## Overview

This method does nothing for non existing array.
Negative indices are promoted to 0(zero).
The swap is stopped at the end of the array and as many as possible elements are swapped.

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.swap](#arrayutilsswap)

### ArrayUtils.swap

#### Example
```bash
myArray=("a" "b" "c" "d")
ArrayUtils.swap    "myArray"                 # failure - ""
ArrayUtils.swap    "myArray"  "2"            # failure - ""
ArrayUtils.swap    "myArray"  "0" "2"        # ("c" "b" "a" "d")

myArray=("a" "b" "c" "d")
ArrayUtils.swap    "myArray"  "0" "2" "1"    # ("c" "b" "a" "d")

myArray=("a" "b" "c" "d")
ArrayUtils.swap    "myArray"  "0" "2" "2"    # ("c" "d" "a" "b")

myArray=("a" "b" "c" "d")
ArrayUtils.swap    "myArray"  "0" "2" "0"    # ("a" "b" "c" "d")

myArray=("a" "b" "c" "d" "e")
ArrayUtils.swap    "myArray"  "0" "2" "2"    # ("c" "d" "a" "b" "e")

myArray=("a" "b" "c" "d" "e")
ArrayUtils.swap    "myArray"  "1" "3"  "3"   # ("a" "d" "e" "b" "c")

```

#### Arguments

* **$1** (ref(string[])): Name of the array to swap. [Default: N/A]
* **$2** (number): The index of the first element in the series to swap [Default: N/A]
* **$3** (number): The index of the second element in the series to swap [Default: N/A]
* **$4** (number): The number of elements to swap starting with the given indices. [Default: 1]

#### Exit codes

* **0**: When the array is swaped.
* **1**: When the input is not an array or the offset/indexes are not integers.

#### Output on stdout

* None.

#### Output on stderr

* None.

#### See also

* [https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/ArrayUtils.html#line.8286](https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/ArrayUtils.html#line.8286)


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


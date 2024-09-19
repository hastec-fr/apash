
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.subarray

Produces a new array containing the elements between the start and end indices.

## Overview

The start index is inclusive, the end index exclusive. 

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.subarray](#arrayutilssubarray)

### ArrayUtils.subarray

#### Example
```bash
myArray=("a" "b" "c" "d")
ArrayUtils.subarray    "myArray"                 # failure - ""
ArrayUtils.subarray    "myArray"  "0"            # failure - ""
ArrayUtils.subarray    "myArray"  "0" "2"        # ("a" "b" "c")

myArray=("a" "b" "c" "d")
ArrayUtils.subarray    "myArray"  "1" "2"        # ("b" "c")

myArray=("a" "b" "c" "d")
ArrayUtils.subarray    "myArray"  "0" "2" "2"    # ("c" "d" "a" "b")

myArray=("a" "b" "c" "d")
ArrayUtils.subarray    "myArray"  "0" "2" "0"    # ("a" "b" "c" "d")

myArray=("a" "b" "c" "d" "e")
ArrayUtils.subarray    "myArray"  "0" "2" "2"    # ("c" "d" "a" "b" "e")

myArray=("a" "b" "c" "d" "e")
ArrayUtils.subarray    "myArray"  "1" "3"  "3"   # ("a" "d" "e" "b" "c")

```

#### Arguments

* **$1** (ref(string[])): Name of the array to subarray. [Default: N/A]
* **$2** (number): The starting index. Undervalue (<0) is promoted to 0, overvalue (>array.length) results in an empty array.
* **$3** (number): The elements up to endIndex-1 are present in the returned subarray. Undervalue (< startIndex) produces empty array, overvalue (>array.length) is demoted to array

#### Exit codes

* **0**: When the subarray is extracted.
* **1**: When the input is not an array or the indexes are not integers.

#### Output on stdout

* None.

#### Output on stderr

* None.

#### See also

* [https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/ArrayUtils.html#line.8286](https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/ArrayUtils.html#line.8286)


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


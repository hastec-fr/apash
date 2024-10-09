
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.reverse

Reverses the order of the given array in the given range.

## Overview

This method does nothing for non existing array.

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.reverse](#arrayutilsreverse)

### ArrayUtils.reverse

#### Arguments
| #      | varName        | Type          | in/out   | Default         | Description                          |
|--------|----------------|---------------|----------|-----------------|--------------------------------------|
| $1     | ioArrayName    | ref(string[]) | in       |                 |  Name of the array to reverse.       |
| $2 ?   | inStartIndex   | number        | in       | 0               |  The starting inclusive index for reversing. Undervalue (<0) is promoted to 0, overvalue (>array.length) results in no change. |
| $3 ?   | inEndIndex     | number        | in       | ${#1[@]} length |  The ending exclusive index (up to endIndex-1) for reversing. Undervalue (< start index) results in no change. Overvalue (>array.length) is demoted to array length. |

#### Example
```bash
myArray=("a" "b" "c" "" "d")
ArrayUtils.reverse  "myVar"           # failure - ""
ArrayUtils.reverse  "myArray"         # failure - ""
ArrayUtils.reverse  "myArray"         # ("d" "" "c" "b" "a")

myArray=("a")
ArrayUtils.reverse  "myArray"  "a"       # ("a")

myArray=("a" "b" "c" "" "d")
ArrayUtils.reverse  "myVar" "2"       #  myArray=("a" "b" "d" "" "c")

myArray=("a" "b" "c" "" "d")
ArrayUtils.reverse  "myVar" "1" "4"   #  myArray=("a" "" "c" "b" "d")

```

#### Exit codes

* **0**: When the array is reversed.
* **1**: When the input is not an array or the indexes are not integers.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


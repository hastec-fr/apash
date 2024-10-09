
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.getLength

Returns the length of the specified array.

## Overview

Take care that the length of an array does not correspond to its last index.
Array indexes are set to Long_MAX_VALUE (9223372036854775807).
Setting this value does not mean that the length is 9223372036854775807.
If you need the last index, prefer the usage of ArrayUtils.getLastIndex.

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->


Method description #########################################################

## Index

* [ArrayUtils.getLength](#arrayutilsgetlength)

### ArrayUtils.getLength

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                          |
|--------|----------------|---------------|----------|------------|--------------------------------------|
| $1     | inArrayName    | ref(string[]) | in       |            | Name of the array to get length.     |

#### Example
```bash
ArrayUtils.getLength  ""             # failure - ""
ArrayUtils.getLength  "myVar"        # failure - ""

declare -A myMap
ArrayUtils.getLength  "myMap"        # failure - ""

myArray=("a" "b" "" "c")
ArrayUtils.getLength  "myArray"      # 4

myArray[9223372036854775807]=z
ArrayUtils.getLength  "myArray"      # 5 ([0]="a" [1]="b" [2]="" [3]="c" [9223372036854775807]="z")

myArray=()
ArrayUtils.getLength  "myArray"      # 0
```

#### Exit codes

* **0**: When input array reference exists.
* **1**: Otherwise.

#### Output on stdout

* The length of the array, or empty if it's not an array or does not exists.

#### Output on stderr

* None.

#### See also

* [ArrayUtils.getLastIndex](./getLastIndex.md)


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


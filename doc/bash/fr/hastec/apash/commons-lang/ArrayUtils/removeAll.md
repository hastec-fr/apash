
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.removeAll

Removes the elements at the specified positions from the specified array.

## Overview

All remaining elements are shifted to the left.

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.removeAll](#arrayutilsremoveall)

### ArrayUtils.removeAll

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                          |
|--------|----------------|---------------|----------|------------|--------------------------------------|
| $1     | ioArrayName    | ref(string[]) | in       |            |  Name of the array to modify.        |
| ${@:2} | inIndexes      | numbers...    | in       |            |  The indexes of the array to remove. |

#### Example
```bash
ArrayUtils.removeAll  ""       ""          # failure
ArrayUtils.removeAll  "myVar"  "0"         # failure

declare -A myMap
ArrayUtils.removeAll  "myMap"  "0"         # failure

myArray=("a" "b" "c" "" "d")
ArrayUtils.removeAll  "myArray"            # failure
ArrayUtils.removeAll  "myArray"  "4"       # ("a" "b" "c" "")
ArrayUtils.removeAll  "myArray"  "0" "2"   # ("b" "")
ArrayUtils.removeAll  "myArray"  "-1"      # failure - ("b" "")

myArray=("a" "b" "c" "" "d")
ArrayUtils.removeAll  "myArray"  "1" "1"   # ("a" "c" "" "d")

myArray=("a")
ArrayUtils.removeAll  "myArray"  "4"       # failure - (a)
ArrayUtils.removeAll  "myArray"  "0"       # ()
ArrayUtils.removeAll  "myArray"  "0"       # failure - ()
```

#### Exit codes

* **0**: When first argument is an array and all indexes are valid numbers.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


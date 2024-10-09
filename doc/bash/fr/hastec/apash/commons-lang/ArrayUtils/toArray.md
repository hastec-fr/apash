
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.toArray

Create an array based on list of arguments

## Overview

The toArray is stopped at the end of the array and as many as possible elements are toArrayed.

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.toArray](#arrayutilstoarray)

### ArrayUtils.toArray

#### Arguments
| #      | varName        | Type          | in/out   | Default         | Description                          |
|--------|----------------|---------------|----------|-----------------|--------------------------------------|
| $1     | ioArrayName    | ref(string[]) | out      |                 | Name of the array to toArray.        |
| ${@:2} | inValues       | string...     | in       |                 | Elements to add to the array.        |

#### Example
```bash
myArray=()
ArrayUtils.toArray    "myArray"                   # ()
ArrayUtils.toArray    "myArray"  "2"              # (2)
ArrayUtils.toArray    "myArray"  "a" "b" "c" "d"  # ("a" "b" "c" "d")
ArrayUtils.toArray    "myArray"  "a" "2" "b"      # ("a" "2" "b")
```

#### Exit codes

* **0**: When list of argument are pushed to the array.
* **1**: When the input is not an array.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.removeDuplicates

Removes elements which are present multiple times in the array.

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

* [ArrayUtils.removeDuplicates](#arrayutilsremoveduplicates)

### ArrayUtils.removeDuplicates

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                          |
|--------|----------------|---------------|----------|------------|--------------------------------------|
| $1     | ioArrayName    | ref(string[]) | in       |            |  Name of the array to modify.        |

#### Example
```bash
myArray=("a" "b" "a" "c")
ArrayUtils.removeDuplicates  "myArray"    # ("a" "b" "c")

myArray=()
ArrayUtils.removeDuplicates  "myArray"    # ()

myArray=("a" "b" "c" "d")
ArrayUtils.removeDuplicates  "myArray"    # ("a" "b" "c" "d")
```

#### Arguments

* **$1** (ref(string[])): Name of the array to modify.

#### Exit codes

* **0**: When first argument is an array.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


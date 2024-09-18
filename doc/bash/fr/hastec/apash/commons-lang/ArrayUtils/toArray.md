
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.toArray

Create an array based on list of arguments

## Overview

The toArray is stopped at the end of the array and as many as possible elements are toArrayped.

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.toArray](#arrayutilstoarray)

### ArrayUtils.toArray

#### Example
```bash
myArray=()
ArrayUtils.toArray    "myArray"                   # ()
ArrayUtils.toArray    "myArray"  "2"              # (2)
ArrayUtils.toArray    "myArray"  "a" "b" "c" "d"  # ("a" "b" "c" "d")
ArrayUtils.toArray    "myArray"  "a" "2" "b"      # ("a" "2" "b")
```

#### Arguments

* **$1** (ref(string[])): Name of the array to toArray. [Default: N/A]
* **$2** (string...): Elements to add to the array [Default: N/A]

#### Exit codes

* **0**: When list of argument are pushed to the array.
* **1**: When the input is not an array.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.insert

Inserts elements into an array at the given index (starting from zero).

## Overview

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.insert](#arrayutilsinsert)

### ArrayUtils.insert

#### Example
```bash
ArrayUtils.insert  ""       ""          # failure
ArrayUtils.insert  "myVar"  "a"         # failure

declare -A myMap
ArrayUtils.insert  "myMap"  "a"         # failure

ioArray=()
ArrayUtils.insert  "0"           "ioArray"              # failure
ArrayUtils.insert  "0"           "ioArray"  "a"         # ("a")
ArrayUtils.insert  "${#ioArray}" "ioArray"  "b" ""      # ("a" "b" "")
ArrayUtils.insert  "2"           "ioArray"  "c" "d"     # ("a" "b" "c" "d" "")
ArrayUtils.insert  "1"           "ioArray"  "foo bar"   # ("a" "foo bar" "b" "c" "d" "")
ArrayUtils.insert  "-1"          "ioArray" "test"      # failure - ("a" "foo bar" "b" "c" "d" "")
```

#### Arguments

* **$1** (number): Positive index of the array to insert values.
* **$2** (ref(string[])): Name of the array to modify.
* **$3** (string...): Values to insert at the indicated index.

#### Exit codes

* **0**: When all elements are inserted.
* **1**: When the index is not a positive number or reference is not an array or there are no value to insert.

#### Output on stdout

* None

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


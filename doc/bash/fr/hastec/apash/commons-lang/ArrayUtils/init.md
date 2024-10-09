
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.init

Defensive programming technique initialize an array.

## Overview

The array is created if the variable is not declared.
If it was an array, then reinitialize it.
If it's an existing variable or map, just fail to protect overriding.

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.init](#arrayutilsinit)

### ArrayUtils.init

#### Example
```bash

myVar="test" 
ArrayUtils.init  "myVar"           # failure

declare -A myMap=([foo]=bar)
ArrayUtils.init  "myVar"           # failure

ArrayUtils.init  "myArray"         # myArray=()

myArray=()
ArrayUtils.init  "myArray"         # myArray=()

myArray=("a" "b" "c")
ArrayUtils.init  "myArray"         # myArray=()
```

#### Exit codes

* **0**: When the array is created.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.

#### See also

* [nullToEmpty](./nullToEmpty.md), [anythingToEmpty](./anythingToEmpty.md)


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


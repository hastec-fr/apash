
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.initWithValue

Initialize an array for a specific width and value

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

* [ArrayUtils.initWithValue](#arrayutilsinitwithvalue)

### ArrayUtils.initWithValue

#### Example
```bash

myVar="test" 
ArrayUtils.initWithValue  "myVar"           # failure

declare -A myMap=([foo]=bar)
ArrayUtils.initWithValue  "myMap"           # failure

ArrayUtils.initWithValue  "myArray" 3       # myArray=("" "" "")

myArray=()
ArrayUtils.initWithValue  "myArray" 4 0     # myArray=(0 0 0 0)

myArray=("a" "b" "c")
ArrayUtils.initWithValue  "myArray" 2 "ah!" # myArray=("ah!" "ah!")
```

#### Exit codes

* **0**: When the array is initialized.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.

#### See also

* [nullToEmpty](./nullToEmpty.md), [anythingToEmpty](./anythingToEmpty.md)


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


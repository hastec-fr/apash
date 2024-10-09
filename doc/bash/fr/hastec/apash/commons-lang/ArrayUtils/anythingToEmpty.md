
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.anythingToEmpty

Create an array even if the variable named was already declared.

## Overview

The reference is transformed in any case in an empty array (even if it's a map or a variable).
Existing arrays are reinitialized.

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.anythingToEmpty](#arrayutilsanythingtoempty)

### ArrayUtils.anythingToEmpty

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                          |
|--------|----------------|---------------|----------|------------|--------------------------------------|
| $1     | ioArrayName    | ref(string[]) | in & out |            | Name of the array to create.         |

#### Example
```bash
myVar="test"
ArrayUtils.anythingToEmpty  "myVar"           # myVar=()

declare -A myMap=([foo]=bar)
ArrayUtils.anythingToEmpty  "myMap"           # myMap=()

ArrayUtils.anythingToEmpty  "myArray"         # myArray=()

myArray=()
ArrayUtils.anythingToEmpty  "myArray"         # myArray=()

myArray=("a" "b" "c")
ArrayUtils.anythingToEmpty  "myArray"         # myArray=()
```

#### Exit codes

* **0**: When the array is created.
* **1**: When the variable name is not valid.

#### Output on stdout

* None.

#### Output on stderr

* None.

#### See also

* [nullToEmpty](./nullToEmpty.md), [init](./init.md)


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


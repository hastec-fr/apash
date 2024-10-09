
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.isNotEmpty

Checks if an array exist and has at least one element.

## Overview

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.isNotEmpty](#arrayutilsisnotempty)

### ArrayUtils.isNotEmpty

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                          |
|--------|----------------|---------------|----------|------------|--------------------------------------|
| $1     | inArrayName    | ref(string[]) | in       |            | The array to check.                  |

#### Example
```bash
ArrayUtils.isNotEmpty ""              # false
ArrayUtils.isNotEmpty "myVar"         # false

declare -A myMap
ArrayUtils.isNotEmpty "myMap"         # false

myArray=()
ArrayUtils.isNotEmpty "myArray"       # false

myArray=("a")
ArrayUtils.isNotEmpty "myArray"       # true 

myArray=("")
ArrayUtils.isNotEmpty "myArray"       # true 
```

#### Exit codes

* **0**: Whether the given array has at least one element.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


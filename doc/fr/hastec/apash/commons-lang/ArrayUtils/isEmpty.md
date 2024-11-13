
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.isEmpty

Checks if an array exist and is empty.

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

* [ArrayUtils.isEmpty](#arrayutilsisempty)

### ArrayUtils.isEmpty

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                          |
|--------|----------------|---------------|----------|------------|--------------------------------------|
| $1     | inArrayName    | ref(string[]) | in       |            | The array to check.                  |

#### Example
```bash
ArrayUtils.isEmpty ""              # false
ArrayUtils.isEmpty "myVar"         # false

declare -A myMap
ArrayUtils.isEmpty "myMap"         # false

myArray=()
ArrayUtils.isEmpty "myArray"       # true

myArray=("a")
ArrayUtils.isEmpty "myArray"       # false

myArray=("")
ArrayUtils.isEmpty "myArray"       # false
```

#### Exit codes

* **0**: Whether the given array has no element.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


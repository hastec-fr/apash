
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.get

Gets the nTh element of an array or a default value if the index is out of bounds.

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

* [ArrayUtils.get](#arrayutilsget)

### ArrayUtils.get

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                          |
|--------|----------------|---------------|----------|------------|--------------------------------------|
| $1     | inArrayName    | ref(string[]) | in       |            |  Name of the array to get value.     |
| $2     | inIndex        | string        | in       |            | Index of the array.                  |
| $3?    | inDefaultValue | string        | in       | ""         | Default value if index is out of bounds |

#### Example
```bash
ArrayUtils.get  ""       ""            # failure - ""
ArrayUtils.get  "myVar"  "a"           # failure - ""

declare -A myMap
ArrayUtils.get  "myMap"  "a"           # failure - ""

myArray=("a" "b" "" "c")
ArrayUtils.get  "myArray"              # failure - ""
ArrayUtils.get  "myArray"  "0"         # "a"
ArrayUtils.get  "myArray"  "3"         # "c"
ArrayUtils.get  "myArray"  "-1"        # failure - ""
ArrayUtils.get  "myArray"  "a" " "     # " "
ArrayUtils.get  "myArray"  "-1" " "    # " "
ArrayUtils.get  "myArray"  "5"  "foo"  # "foo"
```

#### Exit codes

* **0**: When first argument is an array and the index is in the bound of the array without declared default value.
* **1**: Otherwise.

#### Output on stdout

* The nTh element of an array or a default value if the index is out of bounds (and default value is explicitly declared).

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


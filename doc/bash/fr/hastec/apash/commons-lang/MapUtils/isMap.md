
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# MapUtils.isMap

Check if the input name is an map or not.

## Overview

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [MapUtils](../MapUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [MapUtils.isMap](#maputilsismap)

### MapUtils.isMap

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | inDate         | string        | in       |            | Name of the hashmap to check.         |

#### Example
```bash
MapUtils.isMap  ""          # false
MapUtils.isMap  "myVar"     # false

declare -a myArray
MapUtils.isMap  "myArray"   # false

myArray=()
MapUtils.isMap  "myArray"   # false

declare -A myMap
MapUtils.isMap   "myMap"    # true

myMap={}
MapUtils.isMap   "myMap"    # true
```

#### Exit codes

* **0**: When the corresponding variable is a hashmap.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


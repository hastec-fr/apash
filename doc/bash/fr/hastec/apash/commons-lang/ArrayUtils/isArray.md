
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.isArray

Check if the input name is an array or not.

## Overview

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.isArray](#arrayutilsisarray)

### ArrayUtils.isArray

#### Example
```bash
ArrayUtils.isArray  ""          # false
ArrayUtils.isArray  "myVar"     # false

declare -a myArray
ArrayUtils.isArray  "myArray"   # true

myArray=()
ArrayUtils.isArray  "myArray"   # true

declare -A myMap
ArrayUtils.isArray   "myMap"    # false

myMap=(["foo"]="bar")
ArrayUtils.isArray   "myMap"    # false
```

#### Arguments

* **$1** (string): Name of the array.

#### Exit codes

* **0**: Whe the corresponding variable is an array.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.init

Defensive programming technique initialize a map.

## Overview

The map is created if the variable is not declared.
If it was a map, then reinitialize it.
If it's an existing variable or an array, just fail to protect overriding.

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [MapUtils](../MapUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [MapUtils.init](#maputilsinit)

### MapUtils.init

#### Example
```bash

myVar="test" 
MapUtils.init  "myVar"         # failure

myArray=("a" "b" "c")
MapUtils.init  "myArray"       # failure


MapUtils.init  "myMap"         # myMap={}

declare -A myMap=()
MapUtils.init  "myMap"         # myMap={}

declare -A myMap=([foo]=bar)
MapUtils.init  "myMap"         # myMap={ [foo]=bar }

#### Exit codes

* **0**: When the map is created.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# MapUtils.getKeys

Return an array containing all keys of a map.

## Overview

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [MapUtils](../MapUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [MapUtils.getKeys](#maputilsgetkeys)

### MapUtils.getKeys

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | outArrayName   | ref(string[]) | out      |            | Name of the array containing keys.    |
| $2     | inMapName      | ref(string{}) | in       |            | Name of the hashmap to check.         |

#### Example
```bash
declare -A myMap=(["foo"]="bar" ["key"]="value")
MapUtils.getKeys  "myArray" "myMap"          # myArray=(foo bar)
```

#### Exit codes

* **0**: When output array is filled up with the keys.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


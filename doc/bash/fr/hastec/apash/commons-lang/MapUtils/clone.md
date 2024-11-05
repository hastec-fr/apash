
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# MapUtils.clone

Copy a map into another map using references.

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

* [MapUtils.clone](#maputilsclone)

### MapUtils.clone

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                          |
|--------|----------------|---------------|----------|------------|--------------------------------------|
| $1     | inMapName      | ref(string{}) | in       |            | Name of the map to clone.            |
| $2     | outMapName     | ref(string{}) | out      |            | Name of the map which will receive the clone.|

#### Example
```bash
MapUtils.clone  ""       ""               # failure

myVar="dummy"
ArrayUtils.clone  "myVar"  "myClone"      # failure

declare -a myClone
MapUtils.clone  "myVar"  "myClone"        # failure

declare -A myMap=()
declare -A myClone=([foo]="bar")
MapUtils.clone     "myArray"  "myClone"   # myClone={}

declare -A myArray=([foo]="bar" [key]="val")
declare -A myClone=()
MapUtils.clone     "myArray"  "myClone"   # myClone=([foo]="bar" [key]="val")

declare -A myArray=([foo]="bar" [key]="val")
declare -A myClone=([bat]="man")
MapUtils.clone     "myArray"  "myClone"   # myClone={ [foo]="bar" [key]="val" }

```

#### Exit codes

* **0**: When input arguments are maps.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# BashUtils.isDeclared

Defensive programming technique to check that a variable is declared.

## Overview

Arrays and Maps are considered as declared too.

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [BashUtils](../BashUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [BashUtils.isDeclared](#bashutilsisdeclared)

### BashUtils.isDeclared

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | varName        | string        | in       |            | Variable name to check.               |

#### Example
```bash
BashUtils.isDeclared  ""              # false
BashUtils.isDeclared  "myVar"         # false

myVar=myValue
BashUtils.isDeclared  "myVar"         # true

declare -a myArray=()
BashUtils.isDeclared  "myArray"       # true

declare -A myMap=([foo]=bar)
BashUtils.isDeclared  "myMap"         # true

```

#### Exit codes

* **0**: When the variable is declared (even an array or a map).
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.

#### See also

* [](#)


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# BashUtils.isVariableNameValid

Defensive programming technique to check that a variable exists.

## Overview

Arrays and Maps are not considered as variables.
If you need to consider arrays and maps then use BashUtils.isDeclared.

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [BashUtils](../BashUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [BashUtils.isVariable](#bashutilsisvariable)

### BashUtils.isVariable

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | varName        | string        | in       |            | Variable name to check.               |

#### Example
```bash
BashUtils.isVariable  ""              # false
BashUtils.isVariable  "myVar"         # false

myVar=myValue
BashUtils.isVariable  "myVar"         # true

declare -a myArray=()
BashUtils.isVariable  "myArray"       # false

declare -A myMap=([foo]=bar)
BashUtils.isVariable  "myMap"         # false

```

#### Exit codes

* **0**: When the input name corresponds to a variable (not including arrays and maps).
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


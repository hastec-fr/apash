
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# BashUtils.isVariableNameValid

Defensive programming technique to check that a variable name is valid

## Overview

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [BashUtils](../BashUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [BashUtils.isVariableNameValid](#bashutilsisvariablenamevalid)

### BashUtils.isVariableNameValid

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | varName        | string        | in       |            | Variable name to check.               |

#### Example
```bash
BashUtils.isVariableNameValid  ""                # false
BashUtils.isVariableNameValid  "123"             # false
BashUtils.isVariableNameValid  "1myVar"          # false
BashUtils.isVariableNameValid  "my Var"          # false
BashUtils.isVariableNameValid  " myVar"          # false
BashUtils.isVariableNameValid  "myVar "          # false
BashUtils.isVariableNameValid  "my#Var"          # false
BashUtils.isVariableNameValid  "myVér"           # false
BashUtils.isVariableNameValid  "_myVar"          # true
BashUtils.isVariableNameValid  "myVar"           # true
BashUtils.isVariableNameValid  "myVar1"          # true
BashUtils.isVariableNameValid  "my_Var1"         # true
```

#### Exit codes

* **0**: When the name is correct.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


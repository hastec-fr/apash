
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# BashUtils.declareArray

Declare an array at global level with dynamic name.

## Overview

In bash (4.3), the parentheses are required to ensure that array is initialized

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [BashUtils](../BashUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [BashUtils.declareArray](#bashutilsdeclarearray)

### BashUtils.declareArray

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | varName        | string        | in       |            | Variable name to check.               |

#### Example
```bash
BashUtils.declareArray  "myArray"       # myArray=()
```

#### Exit codes

* **0**: When the variable is declared.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


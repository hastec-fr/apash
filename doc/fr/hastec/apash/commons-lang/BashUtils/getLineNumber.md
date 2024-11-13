
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# BashUtils.getLineNumber

Display the line number of the executed function.

## Overview

Bash provides stack of the called function with environment variables ($BASH_LINENO)
Other shells must provide the current line number of the caller with $LINENO.

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [BashUtils](../BashUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [BashUtils.getLineNumber](#bashutilsgetlinenumber)

### BashUtils.getLineNumber

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | inDepth        | string        | in       | APASH_ARRAY_FIRST_INDEX+1 | The depth of the function to retreive.|

#### Example
```bash
BashUtils.getLineNumber  0                          # BashUtils.getLineNumber
myCaller(){ BashUtils.getLineNumber   ; }; myCaller # myCaller
myCaller(){ BashUtils.getLineNumber  1; }; myCaller # myCaller

```

#### Exit codes

* **0**: When the function name is returned.
* **1**: When the index is not valid.

#### Output on stdout

* The function name.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


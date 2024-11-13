
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# BashUtils.getFunctionName

Display the name of the function according to the provided depth

## Overview

Bash and zsh provide stack of the called function with environment variables ($FUNCNAME and $funcstack).
By default, the caller of this function is retreived (depth=1).

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [BashUtils](../BashUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [BashUtils.getFunctionName](#bashutilsgetfunctionname)

### BashUtils.getFunctionName

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | inDepth        | string        | in       | APASH_ARRAY_FIRST_INDEX+1 | The depth of the function to retreive.|

#### Example
```bash
BashUtils.getFunctionName  0                          # BashUtils.getFunctionName
myCaller(){ BashUtils.getFunctionName   ; }; myCaller # myCaller
myCaller(){ BashUtils.getFunctionName  1; }; myCaller # myCaller

```
#### Implementation note
No check on system array (funcstack not detected as an array).

#### Exit codes

* **0**: When the function name is returned.
* **1**: When the index is not valid.

#### Output on stdout

* The function name.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


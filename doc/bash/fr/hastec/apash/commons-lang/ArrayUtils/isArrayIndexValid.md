
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.isArrayIndexValid

Returns whether a given array can safely be accessed at the given index.

## Overview

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.isArrayIndexValid](#arrayutilsisarrayindexvalid)

### ArrayUtils.isArrayIndexValid

#### Example

```bash
ArrayUtils.isArrayIndexValid ""       ""     # false
ArrayUtils.isArrayIndexValid "myVar"  "a"    # false
```

#### Arguments

* **$1** (ref(string[])): The array to inspect.
* **$2** (number): The index of the array to be inspected.

#### Exit codes

* **0**: Whether the given index is safely-accessible in the given array.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


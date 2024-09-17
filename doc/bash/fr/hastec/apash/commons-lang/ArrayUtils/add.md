
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.add

Adds a given element at the end of an array.

## Overview

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.add](#arrayutilsadd)

### ArrayUtils.add

#### Example

```bash
ArrayUtils.add  ""       ""          # failure
ArrayUtils.add  "myVar"  "a"         # failure
```

#### Arguments

* **$1** (ref(string[])): Name of the array to modify.
* **$2** (string): Value to add at the end of the array.

#### Exit codes

* **0**: When first argument is an array and the value is not an embedded array or map.
* **1**: Otherwise.

#### Output on stdout

* None

#### Output on stderr

* None.

#### See also

* [For adding element in the middle of an array, please check insert method.](#for-adding-element-in-the-middle-of-an-array-please-check-insert-method)


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


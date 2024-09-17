
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.addAll

Adds given elements at the end of an array.

## Overview

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.addAll](#arrayutilsaddall)

### ArrayUtils.addAll

#### Example

```bash
ArrayUtils.addAll  ""       ""          # failure
ArrayUtils.addAll  "myVar"  "a"         # failure
```

#### Arguments

* **$1** (ref(string[])): Name of the array to modify.
* **$2** (string...): Values to add at the end of the array.

#### Exit codes

* **0**: When first argument is an array and at least one value is provided.
* **1**: Otherwise.

#### Output on stdout

* None

#### Output on stderr

* None.

#### See also

* [For adding element in the middle of an array, please check insert method.](#for-adding-element-in-the-middle-of-an-array-please-check-insert-method)


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


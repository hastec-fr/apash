
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.removeAll

Removes the elements at the specified positions from the specified array.

## Overview

All remaining elements are shifted to the left.

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.removeAll](#arrayutilsremoveall)

### ArrayUtils.removeAll

#### Example

```bash
ArrayUtils.removeAll  ""       ""          # failure
ArrayUtils.removeAll  "myVar"  "0"         # failure
```

#### Arguments

* **$1** (ref(string[])): Name of the array to modify.
* **$2** (number...): The indexes of the array to remove.

#### Exit codes

* **0**: When first argument is an array and all indexes are valid numbers.
* **1**: Otherwise.

#### Output on stdout

* None

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


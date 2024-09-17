
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.getLength

Returns the length of the specified array.

## Overview

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.getLength](#arrayutilsgetlength)

### ArrayUtils.getLength

#### Example

```bash
ArrayUtils.getLength  ""             # failure - ""
ArrayUtils.getLength  "myVar"        # failure - ""
```

#### Arguments

* **$1** (ref(string[])): Name of the array to get length.

#### Exit codes

* **0**: When input array reference exists.
* **1**: Otherwise.

#### Output on stdout

* The length of the array, or empty if it's not an array or does not exists.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


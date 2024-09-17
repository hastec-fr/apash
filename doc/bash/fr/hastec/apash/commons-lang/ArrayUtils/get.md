
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.get

Gets the nTh element of an array or a default value if the index is out of bounds.

## Overview

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.get](#arrayutilsget)

### ArrayUtils.get

#### Example

```bash
ArrayUtils.get  ""       ""            # failure - ""
ArrayUtils.get  "myVar"  "a"           # failure - ""
```

#### Arguments

* **$1** (ref(string[])): Name of the array to get value.
* **$2** (string): Index of the array.
* **$3** (string): [Optional] Default value if index is out of bounds (default: " ").

#### Exit codes

* **0**: When first argument is an array and the index is in the bound of the array without declared default value.
* **1**: Otherwise.

#### Output on stdout

* The nTh element of an array or a default value if the index is out of bounds (and default value is explicitly declared).

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


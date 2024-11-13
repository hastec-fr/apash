
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# MatrixUtils.getIndex

Return the corresponding array index according to virtual dimensions.

## Overview

⚠️ It is an experimental function.
Negative indexes are not supported for the moment.

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [MatrixUtils](../MatrixUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [MatrixUtils.getIndex](#matrixutilsgetindex)

### MatrixUtils.getIndex

#### Example
```bash
myMatrix=(1 2 3 4 5 6 7 8 9)
MatrixUtils.create myMatrix 3 3
MatrixUtils.getIndex "myMatrix" 0 1  # 1
MatrixUtils.getIndex "myMatrix" 1 0  # 3
MatrixUtils.getIndex "myMatrix" 1    # 3
MatrixUtils.getIndex "myMatrix" 1 2  # 5
MatrixUtils.getIndex "myMatrix" 2 1  # 7
MatrixUtils.getIndex "myMatrix" 1 4  # failure - Out of bounds 
MatrixUtils.getIndex "myMatrix" 3 1  # failure - Out of bounds even if the array has more elements.
```

#### Arguments

* **$1** (ref(string[])): Name of the matrix.
* **$2** (number...): The index at each dimension.

#### Exit codes

* **0**: When the array is created.
* **1**: Otherwise.

#### Output on stdout

* None

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


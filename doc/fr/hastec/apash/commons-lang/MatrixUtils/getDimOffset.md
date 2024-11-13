
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# MatrixUtils.getDimOffsetOffset

Return the corresponding offset before to fall on the next cell of the same dimension.

## Overview

⚠️ It is an experimental function.
For a two dimensional array it return the length of a row.
For a cell, keep at least an offset of 1.

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [MatrixUtils](../MatrixUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [MatrixUtils.getDimOffset](#matrixutilsgetdimoffset)

### MatrixUtils.getDimOffset

#### Example
```bash
myMatrix=(1 2 3 4 5 6 7 8 9)
MatrixUtils.create myMatrix 3 3
MatrixUtils.getDimOffset "myMatrix" 0 1  # 1
MatrixUtils.getDimOffset "myMatrix" 0    # 3
MatrixUtils.getDimOffset "myMatrix" 1    # 3
MatrixUtils.getDimOffset "myMatrix"      # 9
```

#### Arguments

* **$1** (ref(string[])): Name of the matrix.
* **$2** (number...): The index per dimension.

#### Exit codes

* **0**: When the array is created.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


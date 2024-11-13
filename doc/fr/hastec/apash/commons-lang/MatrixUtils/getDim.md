
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# MatrixUtils.getDim

Return the corresponding array according to virtual dimensions.

## Overview

⚠️ It is an experimental function.
The simple case on a two dimensional array is to retreive a row.
For more dimensions, it returns an array containing all sub dimensions
of the current offset.

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [MatrixUtils](../MatrixUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [MatrixUtils.getDim](#matrixutilsgetdim)

### MatrixUtils.getDim

#### Example
```bash
myMatrix=(1 2 3 4 5 6 7 8 9)
MatrixUtils.create "mySubArray" "myMatrix" 3 3
MatrixUtils.getDim "mySubArray" "myMatrix" 0 1  # (1)
MatrixUtils.getDim "mySubArray" "myMatrix" 0    # (1 2 3)
MatrixUtils.getDim "mySubArray" "myMatrix" 1    # (4 5 6)
```

#### Arguments

* **$1** (ref(string[])): Name of the matrix.
* **$2** (number...): The index per dimension.

#### Exit codes

* **0**: When the subarray is returned.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


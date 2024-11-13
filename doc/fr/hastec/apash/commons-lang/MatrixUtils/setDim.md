
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# MatrixUtils.getDim

Apply massive modification to a given dimension.

## Overview

⚠️ It is an experimental function.
The simple case on a two dimensional array is to set a complete row.
For more dimensions, it set all sub dimensions
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

* [MatrixUtils.setDim](#matrixutilssetdim)

### MatrixUtils.setDim

#### Example
```bash
myMatrix=(1 2 3 4 5 6 7 8 9)
myRow=(a b c)
MatrixUtils.create "myMatrix" 3 3 
MatrixUtils.setDim "myMatrix" "myRow" 1     # (1 2 3 a b c 7 8 9)
MatrixUtils.setDim "myMatrix" "myRow" 2 1   # failure - Not enough remaining cell in the dimension
myRow=(d e)
MatrixUtils.setDim "myMatrix" "myRow" 2 1   # (1 2 3 a b c 7 d e)
```

#### Arguments

* **$1** (ref(string[])): Name of the matrix.
* **$2** (ref(string[])): Name of the array with new value.
* **$3** (number...): The index per dimension.

#### Exit codes

* **0**: When the matrix is modified.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# MatrixUtils.isMatrix

Check if all elements defining a matrix are respected.

## Overview

⚠️ It is an experimental function.
Considered as a matrix, an array which has its side array.

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [MatrixUtils](../MatrixUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [MatrixUtils.isMatrix](#matrixutilsismatrix)

### MatrixUtils.isMatrix

#### Example
```bash
MatrixUtils.isMatrix  "myMatrix"  # false

myMatrix=(1 2 3 4 5 6)
MatrixUtils.isMatrix  "myMatrix"  # false

MatrixUtils.create myMatrix 3
MatrixUtils.isMatrix  "myMatrix"  # true
```

#### Arguments

* **$1** (ref(string[])): Name of the array if exists.

#### Exit codes

* **0**: When the matrix exists.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


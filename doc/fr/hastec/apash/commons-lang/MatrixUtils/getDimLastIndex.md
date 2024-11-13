
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# MatrixUtils.getDimLastIndex

Return the corresponding last index of the chosen dimension from the orginal array.

## Overview

⚠️ It is an experimental function.
For a two dimensional arrays it return the last index of a row.

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [MatrixUtils](../MatrixUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [MatrixUtils.getDimLastIndex](#matrixutilsgetdimlastindex)

### MatrixUtils.getDimLastIndex

It transforms the last provided dimension and other missing dimensions
to 0. Then it get the offset of the current dimension to calculate the 
last index.

#### Example
```bash
myMatrix=(1 2 3 4 5 6 7 8 9)
MatrixUtils.create myMatrix 3 3
MatrixUtils.getDimLastIndex "myMatrix" 0    # 2 - zsh: 3
MatrixUtils.getDimLastIndex "myMatrix" 0 1  # 2 - zsh: 3
MatrixUtils.getDimLastIndex "myMatrix" 1    # 5 - zsh: 6
MatrixUtils.getDimLastIndex "myMatrix" 2 0  # 8 - zsh: 9
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


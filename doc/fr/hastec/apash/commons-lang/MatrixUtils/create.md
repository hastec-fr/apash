
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# MatrixUtils.create

Create a side array simulating dimensions on an existing array.

## Overview

⚠️ It is an experimental function.
The side array store dimensions of the expected matrix.
It does not fix bounds of the array. It's just a view of the mind
on how to access a cell on a multi-dimensional array.
⚠️WARNING: 
From Matrix point of view, the first index is 0 (even in zsh).
The real array start from 1 but MatrixUtils consider it as 0.

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [MatrixUtils](../MatrixUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [MatrixUtils.create](#matrixutilscreate)

### MatrixUtils.create

#### Arguments

* **$1** (ref(string[])): Name of the array.
* **$2** (number...): The number of element per dimension.

#### Exit codes

* **0**: When the matrix is created.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


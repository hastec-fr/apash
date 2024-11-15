
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# MatrixUtils.create
Create a side array simulating dimensions on an existing array.

## Description
   ⚠️ It is an experimental function.
   The side array store dimensions of the expected matrix.
   It does not fix bounds of the array. It's just a view of the mind
   on how to access a cell on a multi-dimensional array.
   ⚠️WARNING: 
   From Matrix point of view, the first index is 0 (even in zsh).
   The real array start from 1 but MatrixUtils consider it as 0.

## History
### Since
  * 0.2.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [MatrixUtils](../MatrixUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default         | Description                          |
 |--------|----------------|---------------|----------|-----------------|--------------------------------------|
 | $1     | ioArrayName    | ref(string[]) | out      |                 | Name of the matrix.                  |
 | ${@:2} | $@             | number...     | in       |                 | Number of element per dimension.     |

### Example
 ```bash
    MatrixUtils.create  "myMatrix" 3    # failure; does not create array with 1 dimension
    MatrixUtils.create  "myMatrix" 3 3  # myMatrix=(); apash_dim_myMatrix=(3 3)

    myMatrix=(1 2 3 4 5 6 7 8 9)
    MatrixUtils.create  "myMatrix" 3 3  # myMatrix=(1 2 3 4 5 6 7 8 9); apash_dim_myMatrix=(3 3)
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the matrix is created.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


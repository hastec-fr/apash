
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# MatrixUtils.isMatrix
Check if all elements defining a matrix are respected.
## Description
   ⚠️ It is an experimental function.
   Considered as a matrix, an array which has its side array.

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

### Example
 ```bash
    MatrixUtils.isMatrix  "myMatrix"  # false

    myMatrix=(1 2 3 4 5 6)
    MatrixUtils.isMatrix  "myMatrix"  # false

    MatrixUtils.create myMatrix 3
    MatrixUtils.isMatrix  "myMatrix"  # true
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the matrix exists.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


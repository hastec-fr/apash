
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# MatrixUtils.getDim
Apply massive modification to a given dimension.
## Description
   ⚠️ It is an experimental function.
   The simple case on a two dimensional array is to set a complete row.
   For more dimensions, it set all sub dimensions
   of the current offset.

## History
### Since
  * 0.2.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [MatrixUtils](../MatrixUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName          | Type          | in/out   | Default         | Description                          |
 |--------|------------------|---------------|----------|-----------------|--------------------------------------|
 | $1     | apash_matrixName | ref(string[]) | out      |                 | Name of the matrix.                  |
 | $2     | outArrayName     | ref(string[]) | out      |                 | Name of the array with dimension     |
 | ${@:3} | $@               | number...     | in       |                 | Indexes per dimension.               |

### Example
 ```bash
    myMatrix=(1 2 3 4 5 6 7 8 9)
    myRow=(a b c)
    MatrixUtils.create "myMatrix" 3 3 
    MatrixUtils.setDim "myMatrix" "myRow" 1     # (1 2 3 a b c 7 8 9)
    MatrixUtils.setDim "myMatrix" "myRow" 2 1   # failure - Not enough remaining cell in the dimension
    myRow=(d e)
    MatrixUtils.setDim "myMatrix" "myRow" 2 1   # (1 2 3 a b c 7 d e)
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the matrix is modified.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


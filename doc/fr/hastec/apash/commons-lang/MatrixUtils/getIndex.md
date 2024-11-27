
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# MatrixUtils.getIndex
Return the corresponding array index according to virtual dimensions.
## Description
   ⚠️ It is an experimental function.
   Negative apash_indexes are not supported for the moment.

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
 | ${@:2} | $@               | number...     | in       |                 | Indexes per dimension.               |

### Example
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

### Stdout
  * None
### Stderr
  * None.

### Exit codes
  * **0**: When the array is created.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# MatrixUtils.get
Get a cell of an array according to its associated matrix.
## Description
   ⚠️ It is an experimental function.

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
 | ${@:2} | $@             | number...     | in       |                 | Indexes per dimension.               |

### Example
 ```bash
    # Use matrix representation of:
    #   0 1 2
    # 0 a b c
    # 1 d e f
    # 2 g h i

    local myMatrix=("a" "b" "c" "d" "e" "f" "g" "h" "i")
    MatrixUtils.create "myMatrix" 3 3
    MatrixUtils.get myMatrix          # a
    MatrixUtils.get myMatrix 0 0      # a   
    MatrixUtils.get myMatrix 1 1      # e
    MatrixUtils.get myMatrix 1 4      # failure
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the array is created.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


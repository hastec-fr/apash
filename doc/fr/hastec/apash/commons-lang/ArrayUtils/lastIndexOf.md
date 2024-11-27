
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.lastIndexOf
Finds the last index of the given value in the array starting at the given index.
## Description
   A negative startIndex is treated as zero. A startIndex larger than the array length will return an empty

## History
### Since
  * 0.1.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                          |
 |--------|----------------|---------------|----------|------------|--------------------------------------|
 | $1     | apash_inArrayName    | ref(string[]) | in       |            |  Name of the array to check.         |
 | $2     | apash_inValue        | string        | in       |            |  Value to find.                      |
 | $3 ?   | apash_inStart        | number        | in       | 0          |  The index to start searching at .   |

### Example
 ```bash
    myIndexes=()
    myArray=("a" "b" "" "c" "b")
    ArrayUtils.lastIndexOf  "myArray" "b"       # ("4")
    ArrayUtils.lastIndexOf  "myArray" ""        # ("2")
    ArrayUtils.lastIndexOf  "myArray"           # failure

    myIndexes=(1 2)
    myArray=("a" "b")
    ArrayUtils.lastIndexOf  "myArray" "c"       # -1
    ArrayUtils.lastIndexOf  "myArray" "a" "3"   # -1
    ArrayUtils.lastIndexOf  "myArray" "a" "-1"  # 0
    ArrayUtils.lastIndexOf  "myArray" ""        # -1
  ```

### Stdout
  * The last index of the value within the array, ArrayUtils_INDEX_NOT_FOUND (-1) if not found.
### Stderr
  * None.

### Exit codes
  * **0**: When input array references exist and start index is an integer (when declared).
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


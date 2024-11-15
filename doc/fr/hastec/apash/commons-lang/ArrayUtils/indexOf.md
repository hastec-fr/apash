
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.indexOf
Finds the first index of the given value in the array starting at the given index.
## Description
   A negative startIndex is treated as zero. 
   A startIndex larger than the array length will return an empty.

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
 | $1     | inArrayName    | ref(string[]) | in       |            | Name of the array to check.          |
 | $2     | inValue        | string        | in       |            | Value to find.                       |
 | $3 ?   | inStart        | number        | in       | 0          | The index to start searching at.     |

### Example
 ```bash
    myIndexes=()
    myArray=("a" "b" "" "c" "b")
    ArrayUtils.indexOf  "myArray" "b"       # ("1")
    ArrayUtils.indexOf  "myArray" ""        # ("2")
    ArrayUtils.indexOf  "myArray"           # () - failure

    myIndexes=(1 2)
    myArray=("a" "b")
    ArrayUtils.indexOf  "myArray" "c"       # -1
    ArrayUtils.indexOf  "myArray" "a" "3"   # -1
    ArrayUtils.indexOf  "myArray" "a" "-1"  # 0
    ArrayUtils.indexOf  "myArray" ""        # -1
 ```

### Stdout
  * The index of the value within the array, ArrayUtils_INDEX_NOT_FOUND (-1) if not found.
### Stderr
  * None.

### Exit codes
  * **0**: When input array references exist and start index is an integer (when declared).
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


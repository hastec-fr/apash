
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.getLastIndex
Return the last index of the given array.
## Description
   Empty string is returned if the array is empty.

## History
### Since
  * 0.2.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                          |
 |--------|----------------|---------------|----------|------------|--------------------------------------|
 | $1     | inArrayName    | ref(string[]) | in       |            | Name of the array to check.          |

### Example
 ```bash
    myArray=()
    ArrayUtils.getLastIndex  "myArray"        # "-1"

    myArray=("a" "b" "" "c" "b")
    ArrayUtils.getLastIndex  "myArray"        # 4

    myArray[9223372036854775807]=z
    ArrayUtils.getLastIndex  "myArray"        # 9223372036854775807
  ```

### Stdout
  * The last index of the array.
### Stderr
  * None.

### Exit codes
  * **0**: When input array references exist.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.apash_swap
Swaps a series of elements in the given array.
## Description
   This method does nothing for non existing array.
   Negative indices are promoted to 0(zero).
   The apash_swap is stopped at the end of the array and as many as possible elements are swapped.

## History
### Since
  * 0.1.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default         | Description                          |
 |--------|----------------|---------------|----------|-----------------|--------------------------------------|
 | $1     | apash_ioArrayName    | ref(string[]) | out      |                 | Name of the array to swap.           |
 | $2     | apash_inStartIndex   | number        | in       |                 | The index of the first element in the series to swap   |
 | $3     | apash_inEndIndex     | number        | in       |                 | The index of the second element in the series to swap  |
 | $4     | apash_inLen          | number        | in       | 1               | The number of elements to swap starting with the given indices. |

### Example
 ```bash
    myArray=("a" "b" "c" "d")
    ArrayUtils.swap    "myArray"                 # failure
    ArrayUtils.swap    "myArray"  "2"            # failure
    ArrayUtils.swap    "myArray"  "0" "2"        # ("c" "b" "a" "d")

    myArray=("a" "b" "c" "d")
    ArrayUtils.swap    "myArray"  "0" "2" "1"    # ("c" "b" "a" "d")

    myArray=("a" "b" "c" "d")
    ArrayUtils.swap    "myArray"  "0" "2" "2"    # ("c" "d" "a" "b")

    myArray=("a" "b" "c" "d")
    ArrayUtils.swap    "myArray"  "0" "2" "0"    # ("a" "b" "c" "d")

    myArray=("a" "b" "c" "d" "e")
    ArrayUtils.swap    "myArray"  "0" "2" "2"    # ("c" "d" "a" "b" "e")

    myArray=("a" "b" "c" "d" "e")
    ArrayUtils.swap    "myArray"  "1" "3"  "3"   # ("a" "d" "e" "b" "c")
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the array is swaped.
  * **1**: When the input is not an array or the offset/indexes are not integers.

### See also
  * https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/ArrayUtils.html#line.8286

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


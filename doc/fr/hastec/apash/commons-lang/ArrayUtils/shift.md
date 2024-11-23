
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.shift
Shifts the order of a series of elements in the given array.
## Description
   This method does nothing for non existing array.

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
 | $1     | apash_ioArrayName    | ref(string[]) | in       |                 |  Name of the array to shift.         |
 | $2 ?   | apash_inOffset       | number        | in       | 0               |  The number of positions to rotate the elements. If the offset is larger than the number of elements to rotate, than the effective offset is modulo the number of elements to rotate. |
 | $3 ?   | apash_inStartIndex   | number        | in       | 0               |  The starting inclusive index for reversing. Undervalue (<0) is promoted to 0, overvalue (>array.length) results in no change. |
 | $4 ?   | apash_inEndIndex     | number        | in       | apash_lastIndex+1     |  The ending exclusive index (up to endIndex-1) for reversing. Undervalue (< start index) results in no change. Overvalue (>array.length) is demoted to array length. |

### Example
 ```bash
    myArray=("a" "b" "c" "" "d")
    ArrayUtils.shift    "myArray"                    # ("a" "b" "c" "" "d")
    ArrayUtils.shift    "myArray"  "2"               # ("" "d" "a" "b" "c")

    myArray=("a" "b" "c" "" "d")
    ArrayUtils.shift    "myArray"  "${#myArray[@]}"  # ("a" "b" "c" "" "d")

    myArray=("a" "b" "c" "" "d")
    ArrayUtils.shift    "myArray"  "1" "3"           # ("a" "b" "c" "d" "")

    myArray=("a" "b" "c" "" "d")
    ArrayUtils.shift    "myArray"  "1" "1" "3"       # ("a" "" "b" "c" "d")

    myArray=("a" "b" "c" "" "d")
    ArrayUtils.shift    "myArray"  "-1"              # ("b" "c" "" "d" "a")
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the array is shifted.
  * **1**: When the input is not an array or the offset/indexes are not integers.

### See also
  * https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/ArrayUtils.html#line.6959

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


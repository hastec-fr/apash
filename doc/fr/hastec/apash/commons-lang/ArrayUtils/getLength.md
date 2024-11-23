
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.getLength
Returns the length of the specified array.
## Description
   Take care that the length of an array does not correspond $#.
   Indeed, $# return the number of element in an array.
   It's possible like in bash to have discontinued indexes.
   Array indexes should be less than APASH_ARRAY_LAST_INDEX (limit depending of the shell).

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
 | $1     | inArrayName    | ref(string[]) | in       |            | Name of the array to get length.     |

### Example
 ```bash
    myArray=("a" "b" "" "c")
    ArrayUtils.getLength  "myArray"      # 4

    myArray[9223372036854775807]=z
    ArrayUtils.getLength  "myArray"      # 5 ([0]="a" [1]="b" [2]="" [3]="c" [9223372036854775807]="z")

    myArray=()
    ArrayUtils.getLength  "myArray"      # 0
 ```

### Stdout
  * The length of the array, or empty if it's not an array or does not exists.
### Stderr
  * None.

### Exit codes
  * **0**: When input array reference exists.
  * **1**: Otherwise.

### See also
  * [ArrayUtils.getLastIndex](./getLastIndex.md)
### See also
  * [ArrayUtils.getNumberOfElements](./getNumberOfElements.md)

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


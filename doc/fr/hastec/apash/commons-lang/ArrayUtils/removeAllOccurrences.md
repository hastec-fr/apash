
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.removeAllOccurrences
Removes the occurrences of the specified element from the specified array.
## Description
   All subsequent elements are shifted to the left (subtracts one from their indices). 
   If the array doesn't contains such an element, no elements are removed from the array.
   Not defined cells will be considered as ""

## History
### Since
  * 0.2.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName                           | Type          | in/out   | Default    | Description                          |
 |--------|-----------------------------------|---------------|----------|------------|--------------------------------------|
 | $1     | apash_ArrayUtils_rao_ioArrayName  | ref(string[]) | in       |            |  Name of the array to modify.        |
 | $2     | apash_inValue                     | string        | in       |            |  The value to remove from the array. |

### Example
 ```bash
    myArray=("a" "b" "a" "c" "" "d")
    ArrayUtils.removeAllOccurrences  "myArray"            # failure
    ArrayUtils.removeAllOccurrences  "myArray"  "a"       # ("b" "c" "" "d")
    ArrayUtils.removeAllOccurrences  "myArray"  ""        # ("b" "c" "d")
    ArrayUtils.removeAllOccurrences  "myArray"  "e"       # ("b" "c" "d")

    myArray=("a")
    ArrayUtils.removeAllOccurrences  "myArray"  "a"       # ()
    ArrayUtils.removeAllOccurrences  "myArray"  "a"       # ()

   myArray=("a" "b" "" "c")
   myArray[10]="z"
   ArrayUtils.removeAllOccurrences  "myArray"  ""         # ("a" "b" "c" "z")
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When all arguments are removed from the array.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


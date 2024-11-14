
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.removeElements
Removes the first occurrence of the specified element from the specified array.
## Description
   All subsequent elements are shifted to the left (subtracts one from their indices). 
   If the array doesn't contains such an element, no elements are removed from the array.

## History
### Since
  * 0.1.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.packageEnd -->

#### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                          |
 |--------|----------------|---------------|----------|------------|--------------------------------------|
 | $1     | ioArrayName    | ref(string[]) | in       |            |  Name of the array to modify.        |
 | ${@:2} | inValue        | string...    | in       |            |  List of first occurence of the value to remove from the array. |

#### Example
 ```bash
    myArray=("a" "b" "a" "c" "" "d")
    ArrayUtils.removeElements  "myArray"            # failure
    ArrayUtils.removeElements  "myArray"  "a"       # ("b" "a" "c" "" "d")
    ArrayUtils.removeElements  "myArray"  "a"       # ("b" "c" "" "d")
    ArrayUtils.removeElements  "myArray"  ""        # ("b" "c" "d")
    ArrayUtils.removeElements  "myArray"  "e"       # ("b" "c" "d")

    myArray=("a" "b" "a" "c" "" "d")
    ArrayUtils.removeElements  "myArray"  "a" "a" "d"  # ("b" "c" "")

    myArray=("a")
    ArrayUtils.removeElements  "myArray"  "a"       # ()
    ArrayUtils.removeElements  "myArray"  "a"       # ()
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When all occurences have been removed from the array.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.removeDuplicates
Removes elements which are present multiple times in the array.
## Description
   All remaining elements are shifted to the left.

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
 | $1     | apash_ioArrayName    | ref(string[]) | in       |            |  Name of the array to modify.        |

### Example
 ```bash
    myArray=("a" "b" "a" "c")
    ArrayUtils.removeDuplicates  "myArray"    # ("a" "b" "c")

    myArray=()
    ArrayUtils.removeDuplicates  "myArray"    # ()

    myArray=("a" "b" "c" "d")
    ArrayUtils.removeDuplicates  "myArray"    # ("a" "b" "c" "d")
 ```

 @arg $1 ref(string[]) Name of the array to modify.

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When first argument is an array.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


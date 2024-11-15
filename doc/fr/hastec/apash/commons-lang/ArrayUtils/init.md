
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.init
Defensive programming technique initialize an array.
## Description
   The array is created if the variable is not declared.
   If it was an array, then reinitialize it.
   If it's an existing variable or map, just fail to protect overriding.

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
 | $1     | ref_ArrayUtils_init_ioArrayName    | ref(string[]) | in       |            | Name of the array to initialize.     |

### Example
 ```bash
    ArrayUtils.init  "myArray"         # myArray=()

    myArray=()
    ArrayUtils.init  "myArray"         # myArray=()

    myArray=("a" "b" "c")
    ArrayUtils.init  "myArray"         # myArray=()
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the array is created.
  * **1**: Otherwise.

### See also
  * [nullToEmpty](./nullToEmpty.md), [anythingToEmpty](./anythingToEmpty.md)

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


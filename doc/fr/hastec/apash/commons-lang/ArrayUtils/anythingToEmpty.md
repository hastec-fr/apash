
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.anythingToEmpty
Create an array even if the variable named was already declared.
## Description
   The reference is transformed in any case in an empty array (even if it's a map or a variable).
   Existing arrays are reinitialized.

## History
### Since
  * 0.2.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.packageEnd -->

#### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                          |
 |--------|----------------|---------------|----------|------------|--------------------------------------|
 | $1     | ioArrayName    | ref(string[]) | in & out |            | Name of the array to create.         |

#### Example
 ```bash
    ArrayUtils.anythingToEmpty  "myArray"         # myArray=()

    myArray=()
    ArrayUtils.anythingToEmpty  "myArray"         # myArray=()

    myArray=("a" "b" "c")
    ArrayUtils.anythingToEmpty  "myArray"         # myArray=()
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the array is created.
  * **1**: When the variable name is not valid.

### See also
  * [nullToEmpty](./nullToEmpty.md): Create array if not a variable or a map.
  * [init](./init.md): Initiliaze only if the input is an array.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


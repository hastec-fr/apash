
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.initWithValue
Initialize an array for a specific width and value.
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
 | $1     | ioArrayName    | ref(string[]) | in       |            | Name of the array to initialize.     |
 | $2     | inWidth        | number        | in       | 0          | Number of array record to initialize.|
 | $3     | inValue        | string        | in       | ""         | Value to initialize with.            |

### Example
 ```bash
    ArrayUtils.initWithValue  "myArray" 3       # myArray=("" "" "")

    myArray=()
    ArrayUtils.initWithValue  "myArray" 4 0     # myArray=(0 0 0 0)

    myArray=("a" "b" "c")
    ArrayUtils.initWithValue  "myArray" 2 "ah!" # myArray=("ah!" "ah!")
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the array is initialized.
  * **1**: Otherwise.

### See also
  * [nullToEmpty](./nullToEmpty.md), [anythingToEmpty](./anythingToEmpty.md)

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


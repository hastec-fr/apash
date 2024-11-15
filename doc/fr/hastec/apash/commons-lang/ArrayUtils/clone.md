
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.clone
Copy an array into another array using references.
## Description
   Values and indexes are preserved.

## History
### Since
  * 0.1.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName                             | Type          | in/out   | Default    | Description                          |
 |--------|-------------------------------------|---------------|----------|------------|--------------------------------------|
 | $1     | apash_ArrayUtils_clone_inArrayName  | ref(string[]) | in       |            | Name of the array to clone.          |
 | $2     | apash_ArrayUtils_clone_outArrayName | ref(string[]) | out      |            | Name of the array which will receive the clone.|

### Example
 ```bash
    ArrayUtils.clone  ""       ""               # failure

    myVar="dummy"
    ArrayUtils.clone  "myVar"  "myClone"        # failure

    declare -A myMap
    ArrayUtils.clone  "myMap"  "myClone"        # failure

    myArray=()
    myClone=("a")
    ArrayUtils.clone     "myArray"  "myClone"   # myClone=()
    
    myArray=("a" "b" "" "c")
    myClone=("d" "e" "f")
    ArrayUtils.clone     "myArray"  "myClone"   # myClone=("a" "b" "" "c")

    myArray=("a" "b" "" "c")
    myClone=()
    ArrayUtils.clone     "myArray"  "myClone"   # myClone=("a" "b" "" "c")
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When input arguments are arrays.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


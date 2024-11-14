
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.contains
Checks if the value is in the given array.
## Description
   The method returns false if empty array is passed in.

## History
### Since
  * 0.1.0 (hastec-fr)


## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.packageEnd -->

#### Arguments
 | #      | varName           | Type          | in/out   | Default    | Description                          |
 |--------|-------------------|---------------|----------|------------|--------------------------------------|
 | $1     | apash_inArrayName | ref(string[]) | in       |            | Name of the array to check.          |
 | $2     | apash_inValue     | string        | in       |            | Value to find in the array.          |

#### Example
 ```bash
    ArrayUtils.contains  ""       ""            # false
    ArrayUtils.contains  "myVar"  "a"           # false

    declare -A myMap
    ArrayUtils.contains  "myMap"  "a"           # false

    myArray=("a" "b" "" "c")
    ArrayUtils.contains  "myArray"              # false
    ArrayUtils.contains  "myArray"  "d"         # false
    ArrayUtils.contains  "myArray"  ""          # true
    ArrayUtils.contains  "myArray"  "b"         # true
    ArrayUtils.contains  "myArray"  "a b"       # false
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When first argument is an array and a value to find is provided.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


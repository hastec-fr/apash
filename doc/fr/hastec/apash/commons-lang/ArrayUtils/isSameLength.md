
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.isSameLength
Checks whether two arrays are the same length, return false if it's not an array.

## History
### Since
  * 0.1.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName              | Type          | in/out   | Default    | Description                          |
 |--------|----------------------|---------------|----------|------------|--------------------------------------|
 | $1     | apash_inArrayName1   | ref(string[]) | in       |            | The first array to compare.          |
 | $2     | apash_inArrayName2   | ref(string[]) | in       |            | The second array to compare.         |

### Example
 ```bash
    myArray=()
    ArrayUtils.isSameLength "myArray"  "myArray" # true
    ArrayUtils.isSameLength "myArray"  ""        # false

    myArray1=("a")
    myArray2=("b")
    ArrayUtils.isSameLength "myArray1" "myArray2" # true

    myArray1=("a")
    myArray2=("a" "b")
    ArrayUtils.isSameLength "myArray"  "myArray2" # false

    myArray1=("a")
    myArray2=("a" "b")
    myArray1[10]=z
    ArrayUtils.isSameLength "myArray"  "myArray2" # true
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: True if length of arrays matches.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


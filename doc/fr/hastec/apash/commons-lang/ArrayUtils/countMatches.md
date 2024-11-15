
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.countMatches
Return the number of cells having the given value.

## History
### Since
  * 0.2.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName           | Type          | in/out   | Default    | Description                          |
 |--------|-------------------|---------------|----------|------------|--------------------------------------|
 | $1     | apash_inArrayName | ref(string[]) | in       |            | Name of the array to check.          |
 | $2     | apash_inValue     | string        | in       | ""         | Value to find in the array.          |

### Example
 ```bash
    myArray=("a" "b" "" "a" "c" "" "")
    ArrayUtils.countMatches  "myArray"              # 3
    ArrayUtils.countMatches  "myArray"  "d"         # 0
    ArrayUtils.countMatches  "myArray"  "b"         # 1
    ArrayUtils.countMatches  "myArray"  "a"         # 2
 ```

### Stdout
  * The number of cells having the given value.
### Stderr
  * None.

### Exit codes
  * **0**: When first argument is an array.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


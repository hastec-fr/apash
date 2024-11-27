
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.concat
Concatenate multiple arrays.
## Description
   The final output array can be one of the input arrays.
 
## History
### Since
  * 0.2.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName            | Type          | in/out   | Default    | Description                          |
 |--------|--------------------|---------------|----------|------------|--------------------------------------|
 | $1     | apash_outArrayName | ref(string[]) | out      |            | Name of the array with concatenated arrays. |
 | ${@:2} | $@                 | ref(string[]) | in       |            | Name of the arrays to concatenate.          |

### Example
 ```bash
    local outArray=()
    myArray1=("a" "b" "c")
    myArray2=("d" "e")
    myArray2[3]="f"
    ArrayUtils.countMathes outArray "myArray1" "myArray2" # ("a" "b" "c" "d" "e" "" "f")
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When all arguments are arrays.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


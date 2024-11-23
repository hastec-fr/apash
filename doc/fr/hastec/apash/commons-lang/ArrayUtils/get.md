
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.get
Gets the nTh element of an array or a default value if the index is out of bounds.

## History
### Since
  * 0.2.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName              | Type          | in/out   | Default    | Description                          |
 |--------|----------------------|---------------|----------|------------|--------------------------------------|
 | $1     | apash_inArrayName    | ref(string[]) | in       |            |  Name of the array to get value.     |
 | $2     | apash_inIndex        | string        | in       |            | Index of the array.                  |
 | $3?    | apash_inDefaultValue | string        | in       | ""         | Default value if index is out of bounds. |

### Example
 ```bash
    myArray=("a" "b" "" "c")
    ArrayUtils.get  "myArray"              # ""  - failure
    ArrayUtils.get  "myArray"  "0"         # "a"
    ArrayUtils.get  "myArray"  "3"         # "c"
    ArrayUtils.get  "myArray"  "-1"        # ""  - failure
    ArrayUtils.get  "myArray"  "a" " "     # " "
    ArrayUtils.get  "myArray"  "-1" " "    # " "
    ArrayUtils.get  "myArray"  "5"  "foo"  # "foo"
 ```

### Stdout
  * The nTh element of an array or a default value if the index is out of bounds (and default value is explicitly declared).
### Stderr
  * None.

### Exit codes
  * **0**: When first argument is an array and the index is in the bound of the array without declaring a default value.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


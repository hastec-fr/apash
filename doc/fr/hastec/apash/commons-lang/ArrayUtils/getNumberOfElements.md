
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.getNumberOfElements
Returns the number of elements in the arrays.
## Description
   This number correspond to the lenght in zsh and could be different in bash
   due to the discontinued indexes.

## History
### Since
  * 0.2.0 (hastec-fr)

### Authors:
 * Benjamin VARGIN

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.packageEnd -->

#### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                          |
 |--------|----------------|---------------|----------|------------|--------------------------------------|
 | $1     | inArrayName    | ref(string[]) | in       |            | Name of the array to get length.     |

#### Example
 ```bash
    myArray=("a" "b" "" "c")
    ArrayUtils.getNumberOfElements  "myArray"      # 4

    myArray[10]=z
    ArrayUtils.getNumberOfElements  "myArray"      # bash: 5, zsh: 10

    myArray=()
    ArrayUtils.getNumberOfElements  "myArray"      # 0
 ```

### Stdout
  * The number of element, or empty if it's not an array or does not exists.
### Stderr
  * None.

### Exit codes
  * **0**: When input array reference exists.
  * **1**: Otherwise.

### See also
  * [ArrayUtils.getLastIndex](./getLastIndex.md)

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


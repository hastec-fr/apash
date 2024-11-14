
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.nullToEmpty
Defensive programming technique to change a null reference to an empty Array

## Description
   Only non referred variables are automatically transformed to emptyArray.
   If array already exists, then nothing is done.

## History
### Since
  * 0.1.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.packageEnd -->

#### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                          |
 |--------|----------------|---------------|----------|------------|--------------------------------------|
 | $1     | ioArrayName    | ref(string[]) | in       |            |  Name of the array if exists.        |

#### Example
 ```bash
    ArrayUtils.nullToEmpty  ""                # failure

    myVar=test
    ArrayUtils.nullToEmpty  "myVar"           # failure

    declare -A myMap
    ArrayUtils.nullToEmpty  "myMap"           # failure

    ArrayUtils.nullToEmpty  "myUndefVar"      # myUndefVar=()

    myArray=()
    ArrayUtils.nullToEmpty  "myArray"         # myArray=()

    myArray=("a" "b" "c")
    ArrayUtils.nullToEmpty  "myArray"  "a"    # myArray=("a" "b" "c")
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the array is created.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


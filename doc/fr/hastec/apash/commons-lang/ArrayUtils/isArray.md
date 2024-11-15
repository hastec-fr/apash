
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.isArray
Check if the input name is an array or not.

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
 | $1     | inVarName      | string        | in       |            | Name of the array.                   |
 
### Example
 ```bash
    ArrayUtils.isArray  ""          # false
    ArrayUtils.isArray  "myVar"     # false

    declare -a myArray
    ArrayUtils.isArray  "myArray"   # true
   
    myArray=()
    ArrayUtils.isArray  "myArray"   # true

    declare -A myMap
    ArrayUtils.isArray   "myMap"    # false

    myMap=(["foo"]="bar")
    ArrayUtils.isArray   "myMap"    # false
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: Whe the corresponding variable is an array.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# MapUtils.isMap
Check if the input name is an map or not.

## History
### Since
  * 0.1.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [MapUtils](../MapUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                           |
 |--------|----------------|---------------|----------|------------|---------------------------------------|
 | $1     | inDate         | string        | in       |            | Name of the hashmap to check.         |

### Example
 ```bash
    MapUtils.isMap  ""                # false
    MapUtils.isMap  "myVar"           # false

    declare -a myArray
    MapUtils.isMap  "myArray"         # false
   
    myArray=()
    MapUtils.isMap  "myArray"         # false

    declare -A myMap
    MapUtils.isMap   "myMap"          # true

    declare -A myMap=(["foo"]="bar" ["key"]="value")
    MapUtils.containsKey   "myMap"    # true
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the corresponding variable is a hashmap.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


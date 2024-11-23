
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.init
Defensive programming technique initialize a map.
## Description
   The map is created if the variable is not declared.
   If it was a map, then reinitialize it.
   If it's an existing variable or an array, then fail (prevent overriding).

## History
### Since
  * 0.2.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [MapUtils](../MapUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                          |
 |--------|----------------|---------------|----------|------------|--------------------------------------|
 | $1     | ioMapName      | ref(string{}) | in/out   |            | Name of the map to initialize.       |

### Example
 ```bash
    
    myVar="test" 
    MapUtils.init  "myVar"         # failure

    myArray=("a" "b" "c")
    MapUtils.init  "myArray"       # failure


    MapUtils.init  "myMap"         # myMap={}

    declare -A myMap=()
    MapUtils.init  "myMap"         # myMap={}

    declare -A myMap=([foo]=bar)
    MapUtils.init  "myMap"         # myMap={ [foo]=bar }
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the map is created.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


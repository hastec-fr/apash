
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# MapUtils.containsKey
Check if the input value is present in the input map.

## History
### Since
  * 0.2.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [MapUtils](../MapUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                           |
 |--------|----------------|---------------|----------|------------|---------------------------------------|
 | $1     | apash_inMapName      | ref(string{}) | in       |            | Name of the hashmap to check.         |
 | $2     | apash_inKey          | string        | in       |            | Key to check.                         |

### Example
 ```bash
    declare -A myMap=(["foo"]="bar" ["key"]="value")
    MapUtils.containsKey   "myMap"          # false
    MapUtils.containsKey   "myMap" "foo"    # true
    MapUtils.containsKey   "myMap" "wrong"  # false
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the input key is present in the hashmap.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


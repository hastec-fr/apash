
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.isEmpty
Checks if an array exist and is empty.

## History
### Since
  * 0.1.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                          |
 |--------|----------------|---------------|----------|------------|--------------------------------------|
 | $1     | inArrayName    | ref(string[]) | in       |            | The array to check.                  |

### Example
 ```bash
    ArrayUtils.isEmpty "myArray"       # false

    myArray=()
    ArrayUtils.isEmpty "myArray"       # true

    myArray=("a")
    ArrayUtils.isEmpty "myArray"       # false

    myArray=("")
    ArrayUtils.isEmpty "myArray"       # false
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: Whether the given array has no element.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


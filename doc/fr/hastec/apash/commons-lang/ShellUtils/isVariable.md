
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ShellUtils.isVariable
Defensive programming technique to check that a variable exists.
## Description
   Arrays and Maps are not considered as variables.
   If you need to consider arrays and maps then use ShellUtils.isDeclared.

## History
### Since
  * 0.2.0 (hastec-fr)
 
## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ShellUtils](../ShellUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                           |
 |--------|----------------|---------------|----------|------------|---------------------------------------|
 | $1     | varName        | string        | in       |            | Variable name to check.               |

### Example
 ```bash
    ShellUtils.isVariable  ""              # false
    ShellUtils.isVariable  "myVar"         # false

    myVar=myValue
    ShellUtils.isVariable  "myVar"         # true

    declare -a myArray=()
    ShellUtils.isVariable  "myArray"       # false

    declare -A myMap=([foo]=bar)
    ShellUtils.isVariable  "myMap"         # false
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the input name corresponds to a variable (not including arrays and maps).
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


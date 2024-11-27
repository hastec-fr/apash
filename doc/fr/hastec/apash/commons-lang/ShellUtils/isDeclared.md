
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ShellUtils.isDeclared
Defensive programming technique to check that a variable is declared.
## Description
   Arrays and Maps are considered as declared too.

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
    ShellUtils.isDeclared  ""              # false
    ShellUtils.isDeclared  "myVar"         # false

    myVar=myValue
    ShellUtils.isDeclared  "myVar"         # true

    declare -a myArray=()
    ShellUtils.isDeclared  "myArray"       # true

    declare -A myMap=([foo]=bar)
    ShellUtils.isDeclared  "myMap"         # true
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the variable is declared (even an array or a map).
  * **1**: Otherwise.

### See also
 - [ShellUtils.isDeclared](./isDeclared.md), 
 - [ArrayUtils.isArray](../ArrayUtils/isArray.md),
 - [MapUtils.isMap](../MapUtils/isMap.md)

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


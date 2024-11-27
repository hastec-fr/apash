
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ShellUtils.declareArray
Declare an array at global level with dynamic name.
## Description
   In bash (4.3), the parentheses are required to ensure that array is initialized.

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
    ShellUtils.declareArray  "myArray"       # myArray=()
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the variable is declared.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


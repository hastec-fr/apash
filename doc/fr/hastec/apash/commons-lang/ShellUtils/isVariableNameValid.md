
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ShellUtils.isVariableNameValid
Defensive programming technique to check that a variable name is valid.
## Description

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
    ShellUtils.isVariableNameValid  ""                # false
    ShellUtils.isVariableNameValid  "123"             # false
    ShellUtils.isVariableNameValid  "1myVar"          # false
    ShellUtils.isVariableNameValid  "my Var"          # false
    ShellUtils.isVariableNameValid  " myVar"          # false
    ShellUtils.isVariableNameValid  "myVar "          # false
    ShellUtils.isVariableNameValid  "my#Var"          # false
    ShellUtils.isVariableNameValid  "myVér"           # false
    ShellUtils.isVariableNameValid  "_myVar"          # true
    ShellUtils.isVariableNameValid  "myVar"           # true
    ShellUtils.isVariableNameValid  "myVar1"          # true
    ShellUtils.isVariableNameValid  "my_Var1"         # true
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the name is correct.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


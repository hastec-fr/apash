
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# BashUtils.isVariableNameValid
Defensive programming technique to check that a variable name is valid.
## Description

## History
### Since
  * 0.2.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [BashUtils](../BashUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                           |
 |--------|----------------|---------------|----------|------------|---------------------------------------|
 | $1     | varName        | string        | in       |            | Variable name to check.               |

### Example
 ```bash
    BashUtils.isVariableNameValid  ""                # false
    BashUtils.isVariableNameValid  "123"             # false
    BashUtils.isVariableNameValid  "1myVar"          # false
    BashUtils.isVariableNameValid  "my Var"          # false
    BashUtils.isVariableNameValid  " myVar"          # false
    BashUtils.isVariableNameValid  "myVar "          # false
    BashUtils.isVariableNameValid  "my#Var"          # false
    BashUtils.isVariableNameValid  "myVér"           # false
    BashUtils.isVariableNameValid  "_myVar"          # true
    BashUtils.isVariableNameValid  "myVar"           # true
    BashUtils.isVariableNameValid  "myVar1"          # true
    BashUtils.isVariableNameValid  "my_Var1"         # true
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the name is correct.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


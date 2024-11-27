
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ShellUtils.isCommandValid
Defensive programming technique to check that a variable name is valid
## Description

## History
### Since
  * 0.1.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ShellUtils](../ShellUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                           |
 |--------|----------------|---------------|----------|------------|---------------------------------------|
 | $1     | commandName    | string        | in       |            | Command to analyse                    |

### Example
 ```bash
    ShellUtils.isCommandValid  ""                # false
    ShellUtils.isCommandValid  "apashnotexist"   # false
    ShellUtils.isCommandValid  "command"         # true
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When the command name is correct.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


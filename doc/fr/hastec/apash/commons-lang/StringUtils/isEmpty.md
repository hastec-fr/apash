
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# StringUtils.isEmpty
Checks if a string is empty ("") or not existing.
## Description

## History
### Since
  * 0.1.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                           |
 |--------|----------------|---------------|----------|------------|---------------------------------------|
 | $1     | inString       | string        | in       |            | The string to check.                  |

### Example
 ```bash
    StringUtils.isEmpty ""            # true
    StringUtils.isEmpty "     "       # false
    StringUtils.isEmpty "Hello World" # false
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: If no argument or an agurment of length 0 is passed.
  * **1**: If the argument with at lead one character (even space) is passed.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


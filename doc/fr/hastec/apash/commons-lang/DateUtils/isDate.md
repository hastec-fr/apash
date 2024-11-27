
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# DateUtils.isDate
Check if the input string has an UTC valid format (used accross all apash date functions)
## Description
   Let the date command trying to parse the value.

## History
### Since
  * 0.1.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [DateUtils](../DateUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                           |
 |--------|----------------|---------------|----------|------------|---------------------------------------|
 | $1     | inDate         | date          | in       |            | The date to check                     |

### Example
 ```bash
    DateUtils.isDate ""                              # false
    DateUtils.isDate "20240914"                      # false
    DateUtils.isDate "2024-09-14T10:30"              # false
    DateUtils.isDate "2022-03-15T14:30:45.123+0000"  # true
 ```

### Stdout
  * The new Date with the amount added.
### Stderr
  * None.

### Exit codes
  * **0**: When are using the correct format of date and integer.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


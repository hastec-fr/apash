
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# DateUtils.addWeeks
Adds a number of weeks to a date returning a new date.
## Description

## History
### Since
  * 0.2.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [DateUtils](../DateUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                           |
 |--------|----------------|---------------|----------|------------|---------------------------------------|
 | $1     | inDate         | date          | in       |            | The date in UTC format.               |
 | $2 ?   | inAmount       | number        | in       | 0          | The amount of weeks to add, may be negative. |

### Example
 ```bash
    DateUtils.addWeeks ""                               ""    # failure
    DateUtils.addWeeks "0"                              ""    # failure
    DateUtils.addWeeks "2024-04-01T14:00:00.123+0200"   "1"   # 2024-04-08T14:00:00.123+0200
    DateUtils.addWeeks "2024-04-01T14:00:00.123+0200"   "-1"  # 2024-03-25T14:00:00.123+0100
    DateUtils.addWeeks "2024-04-01T14:00:00.123+0200"   "5"   # 2024-05-05T14:00:00.123+0200
    DateUtils.addWeeks "2024-04-01T14:00:00.123+0200"   "1.2" # failure
 ```

### Stdout
  * The new Date with the added amount of seconds.
### Stderr
  * None.

### Exit codes
  * **0**: When are using the correct format of date and integer.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


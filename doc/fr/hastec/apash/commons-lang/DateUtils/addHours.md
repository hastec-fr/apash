
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# DateUtils.addHours
Adds a number of hours to a date returning a new date.

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
 | $1     | inDate         | date          | in       |            | The date in UTC format.               |
 | $2 ?   | inAmount       | number        | in       | 0          | The amount of hours to add, may be negative. |

### Example
 ```bash
    DateUtils.addHours ""                               ""    # failure - ""
    DateUtils.addHours "0"                              ""    # failure - ""
    DateUtils.addHours "2022-03-14T14:30:45.123+0200"   "1"   # 2022-03-14T15:30:45.123+0200
    DateUtils.addHours "2022-03-14T14:30:45.123+0200"   "-1"  # 2022-03-13T13:30:45.123+0200
    DateUtils.addHours "2022-03-14T14:30:45.123+0200"   "1.2" # failure - ""

### Stdout
  * The new Date with the added amount of hours.
### Stderr
  * None.

### Exit codes
  * **0**: When are using the correct format of date and integer.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


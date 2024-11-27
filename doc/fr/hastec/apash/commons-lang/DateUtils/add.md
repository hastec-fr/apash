
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# DateUtils.add
Adds a number of specified unity to a date, returning a new date.

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
 | $2     | inAmount       | number        | in       |            | The amount of unity to add, may be negative. |
 | $3     | inType         | string        | in       |            | The type of unity to add to the date.        |

### Example
 ```bash
    DateUtils.add ""                               ""       "hours" # failure
    DateUtils.add "0"                              ""       "hours" # failure
    DateUtils.add "2022-03-14T14:30:45.123+0200"   "1"      "days"  # 2022-03-15T14:30:45.123+0200
    DateUtils.add "2022-03-14T14:30:45.123+0200"   "-1"     "days"  # 2022-03-13T14:30:45.123+0200
    DateUtils.add "2022-03-14T14:30:45.123+0200"   "1"      "hours" # 2022-03-14T15:30:45.123+0200
    DateUtils.add "2022-03-14T14:30:45.123+0200"   "-1"     "hours" # 2022-03-14T13:30:45.123+0200
    DateUtils.add "2022-03-14T14:30:45.123+0200"   "1.2"    "hour"  # failure
 ```

### Stdout
  * The new Date with the added amount.
### Stderr
  * None.

### Exit codes
  * **0**: When are using the correct format of date and integer.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


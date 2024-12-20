
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# DateUtils.addMinutes
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
 | $2 ?   | inAmount       | number        | in       | 0          | The amount of minutes to add, may be negative. |

### Example
 ```bash
    DateUtils.addMinutes ""                               ""    # failure - ""
    DateUtils.addMinutes "0"                              ""    # failure - ""
    DateUtils.addMinutes "2022-03-14T14:00:00.123+0200"   "1"   # 2022-03-14T14:01:00.123+0200
    DateUtils.addMinutes "2022-03-14T14:00:00.123+0200"   "-1"  # 2022-03-13T13:59:00.123+0200
    DateUtils.addMinutes "2022-03-14T14:00:00.123+0200"   "60"  # 2022-03-13T15:00:00.123+0200
    DateUtils.addMinutes "2022-03-14T14:00:00.123+0200"   "1.2" # failure - ""
 ```

### Stdout
  * The new Date with the added amount of minutes.
### Stderr
  * None.

### Exit codes
  * **0**: When are using the correct format of date and integer.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


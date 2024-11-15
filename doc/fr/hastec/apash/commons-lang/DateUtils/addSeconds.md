
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# DateUtils.addSeconds
Adds a number of seconds to a date returning a new date.

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
 | $2 ?   | inAmount       | number        | in       | 0          | The amount of seconds to add, may be negative. |

### Example
 ```bash
    DateUtils.addSeconds ""                               ""    # failure
    DateUtils.addSeconds "0"                              ""    # failure
    DateUtils.addSeconds "2024-04-01T14:00:00.123+0200"   "1"   # 2024-04-01T14:00:00.123+0200
    DateUtils.addSeconds "2024-04-01T14:00:00.123+0200"   "-1"  # 2024-04-01T13:59:59.123+0200
    DateUtils.addSeconds "2024-04-01T14:00:00.123+0200"   "60"  # 2024-04-01T14:01:00.123+0200
    DateUtils.addSeconds "2024-04-01T14:00:00.123+0200"   "1.2" # failure
```

### Stdout
  * The new Date with the added amount of seconds.
### Stderr
  * None.

### Exit codes
  * **0**: When are using the correct format of date and integer.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# DateUtils.addMonths

Adds a number of hours to a date returning a new date.

## Overview

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [DateUtils](../DateUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [DateUtils.addMonths](#dateutilsaddmonths)

### DateUtils.addMonths

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | inDate         | date          | in       |            | The date in UTC format.               |
| $2 ?   | inAmount       | number        | in       | 0          | The amount of months to add, may be negative. |

#### Example

```bash
DateUtils.addMonths ""                               ""    # failure - ""
DateUtils.addMonths "0"                              ""    # failure - ""
DateUtils.addMonths "2024-04-01T14:00:00.123+0200"   "1"   # 2024-05-01T14:00:00.123+0200
DateUtils.addMonths "2024-04-01T14:00:00.123+0200"   "-1"  # 2024-03-01T14:00:00.123+0100
DateUtils.addMonths "2024-04-01T14:00:00.123+0200"   "12"  # 2025-04-01T14:00:00.123+0200
DateUtils.addMonths "2024-04-01T14:00:00.123+0200"   "1.2" # failure - ""
```

#### Exit codes

* **0**: When are using the correct format of date and integer.
* **1**: Otherwise.

#### Output on stdout

* The new Date with the added amount of months.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


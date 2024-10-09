
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# DateUtils.addDays

Adds a number of days to a date returning a new date.

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

* [DateUtils.addDays](#dateutilsadddays)

### DateUtils.addDays

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | inDate         | date          | in       |            | The date in UTC format.               |
| $2 ?   | inAmount       | number        | in       | 0          | The amount of day to add, may be negative. |

#### Example

```bash
DateUtils.addDays ""                               ""    # failure - ""
DateUtils.addDays "0"                              ""    # failure - ""
DateUtils.addDays "2022-03-14T14:30:45.123+0200"   "1"   # 2022-03-15T14:30:45.123+0200
DateUtils.addDays "2022-03-14T14:30:45.123+0200"   "-1"  # 2022-03-13T14:30:45.123+0200
DateUtils.addDays "2022-03-14T14:30:45.123+0200"   "1.2" # failure - ""
```

#### Exit codes

* **0**: When are using the correct format of date and integer.
* **1**: Otherwise.

#### Output on stdout

* The new Date with the added amount of days.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


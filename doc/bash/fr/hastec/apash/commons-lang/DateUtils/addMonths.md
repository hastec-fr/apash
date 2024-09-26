
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# DateUtils.addMonths

Adds a number of hours to a date returning a new date.

## Overview

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [DateUtils](../DateUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [DateUtils.addMonths](#dateutilsaddmonths)

### DateUtils.addMonths

#### Example

```bash
DateUtils.addMonths ""                               ""    # failure - ""
DateUtils.addMonths "0"                              ""    # failure - ""
DateUtils.addMonths "2024-04-01T14:00:00.123+0200"   "1"   # 2024-04-01T14:00:00.123+0200
DateUtils.addMonths "2024-04-01T14:00:00.123+0200"   "-1"  # 2024-03-01T14:00:00.123+0100
DateUtils.addMonths "2024-04-01T14:00:00.123+0200"   "12"  # 2025-04-01T14:00:00.123+0200
DateUtils.addMonths "2024-04-01T14:00:00.123+0200"   "1.2" # failure - ""
```

#### Arguments

* **$1** (The): date in UTC format
* **$2** (The): amount of month to add, may be negative. [Default=0]

#### Exit codes

* **0**: When are using the correct format of date and integer.
* **1**: Otherwise.

#### Output on stdout

* The new Date with the amount added.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


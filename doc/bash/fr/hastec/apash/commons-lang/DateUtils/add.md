
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# DateUtils.addHours

Adds a number of specified unity to a date returning a new date.

## Overview

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [DateUtils](../DateUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [DateUtils.add](#dateutilsadd)

### DateUtils.add

#### Example

```bash
DateUtils.add ""                               ""       "hours" # failure - ""
DateUtils.add "0"                              ""       "hours" # failure - ""
DateUtils.add "2022-03-14T14:30:45.123+0200"   "1"      "days"  # 2022-03-15T14:30:45.123+0200
DateUtils.add "2022-03-14T14:30:45.123+0200"   "-1"     "days"  # 2022-03-13T14:30:45.123+0200
DateUtils.add "2022-03-14T14:30:45.123+0200"   "1"      "hours" # 2022-03-14T15:30:45.123+0200
DateUtils.add "2022-03-14T14:30:45.123+0200"   "-1"     "hours" # 2022-03-14T13:30:45.123+0200
DateUtils.add "2022-03-14T14:30:45.123+0200"   "1.2"    "hour"  # failure - ""
```

#### Arguments

* **$1** (The): date in UTC format
* **$2** (The): amount of hours to add, may be negative. [Default=0]
* **$3** (The): type of unity to add to the date. [Default=N/A]

#### Exit codes

* **0**: When are using the correct format of date and integer.
* **1**: Otherwise.

#### Output on stdout

* The new Date with the amount added.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


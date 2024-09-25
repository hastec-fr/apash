
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# DateUtils.addDays

Adds a number of days to a date returning a new object.

## Overview

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [DateUtils](../DateUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [DateUtils.addDays](#dateutilsadddays)

### DateUtils.addDays

#### Example

```bash
DateUtils.addDays ""                               ""    # failure - ""
DateUtils.addDays "0"                              ""    # failure - ""
DateUtils.addDays "2022-03-14T14:30:45.123+0200"   "1"   # 2022-03-15T14:30:45.123+0200
DateUtils.addDays "2022-03-14T14:30:45.123+0200"   "-1"  # 2022-03-13T14:30:45.123+0200
DateUtils.addDays "2022-03-14T14:30:45.123+0200"   "1.2" # failure - ""
```

#### Arguments

* **$1** (The): date in UTC format
* **$2** (The): amount of dayd to add, may be negative. [Default=0]

#### Exit codes

* **0**: When are using the correct format of date and integer.
* **1**: Otherwise.

#### Output on stdout

* The new Date with the amount added.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


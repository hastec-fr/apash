
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# DateUtils.isDate

Check if the input string has an UTC valid format (used accross all apash date functions)

## Overview

Let the date command trying to parse the value.
### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [DateUtils](../DateUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [DateUtils.isDate](#dateutilsisdate)

### DateUtils.isDate

#### Example

```bash
DateUtils.isDate ""                              # false
DateUtils.isDate "20240914"                      # false
DateUtils.isDate "2024-09-14T10:30"              # false
DateUtils.isDate "2022-03-15T14:30:45.123+0000"  # true
```

#### Arguments

* **$1** (The): date in UTC format
* **$2** (The): amount to add, may be negative. [Default=0]

#### Exit codes

* **0**: When are using the correct format of date and integer.
* **1**: Otherwise.

#### Output on stdout

* The new Date with the amount added.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


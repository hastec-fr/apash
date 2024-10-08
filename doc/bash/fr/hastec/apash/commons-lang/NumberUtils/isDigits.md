
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# NumberUtils.isDigits

Checks whether the String contains only digit characters.

## Overview

So numbers with "-" and "." will return false.
Because these character are not digits.

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [NumberUtils](../NumberUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [NumberUtils.isDigits](#numberutilsisdigits)

### NumberUtils.isDigits

#### Example

```bash
NumberUtils.isDigits ""      # false
NumberUtils.isDigits "a"     # false
NumberUtils.isDigits "a12"   # false
NumberUtils.isDigits "-12"   # true
NumberUtils.isDigits "1.2"   # false
NumberUtils.isDigits " 12"   # false
NumberUtils.isDigits "123"   # true
NumberUtils.isDigits "000"   # true
```

#### Arguments

* **$1** (number): The number to analyze.

#### Exit codes

* **0**: When the input string has only digits.
* **1**: When the input string contains characters other than digits.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


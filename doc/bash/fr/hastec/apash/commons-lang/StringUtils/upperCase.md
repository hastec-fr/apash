
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.upperCase

Converts a String to upper case.

## Overview

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.upperCase](#stringutilsuppercase)

### StringUtils.upperCase

#### Example

```bash
StringUtils.upperCase ""              # ""
StringUtils.upperCase "abc"           # "ABC"
StringUtils.upperCase "aBc"           # "ABC"
StringUtils.upperCase "a123b"         # "A123B"
StringUtils.upperCase "ABC"           # "ABC"
StringUtils.upperCase "crème brûlée"  # "CRÈME BRÛLÉE"
```

#### Arguments

* **$1** (string): The string to upper case

#### Exit codes

* **0**: When result is displayed.
* **1**: Otherwise.

#### Output on stdout

* The upper cased string

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


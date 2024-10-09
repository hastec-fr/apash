
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.lowerCase

Converts a String to lower case.

## Overview

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.lowerCase](#stringutilslowercase)

### StringUtils.lowerCase

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | inString       | string        | in       |            | The string to lower case.             |

#### Example

```bash
StringUtils.upperCase ""              # ""
StringUtils.upperCase "ABC"           # "abc"
StringUtils.upperCase "AbC"           # "abc"
StringUtils.upperCase "A123B"         # "a123b"
StringUtils.upperCase "abc"           # "abc"
StringUtils.upperCase "CRÈME BRÛLÉE"  # "crème brûlée"
```

#### Arguments

* $1 string

#### Exit codes

* **0**: When result is displayed.
* **1**: Otherwise.

#### Output on stdout

* The lower cased string

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


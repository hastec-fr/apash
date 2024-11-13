
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# NumberUtils.isLongPositive

Checks whether the String contains has the form of a valid long positive integer.

## Overview

Numbers with and "." will return false. Only numbers with 
optional minus first and digits after are considered as valid.

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [NumberUtils](../NumberUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [NumberUtils.isLongPositive](#numberutilsislongpositive)

### NumberUtils.isLongPositive

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | inNumber       | number        | in       |            | The number to check.                  |

#### Example

```bash
NumberUtils.isLongPositive "0"                    # true
NumberUtils.isLongPositive "1"                    # true
NumberUtils.isLongPositive "9223372036854775807"  # true
NumberUtils.isLongPositive "9223372036854775808"  # false
NumberUtils.isLongPositive "-1"                   # false
NumberUtils.isLongPositive "1.2"                  # false
NumberUtils.isLongPositive "a"                    # false
NumberUtils.isLongPositive                        # false
```

#### Exit codes

* **0**: When the input string is a long int.
* **1**: When the input string contains characters other than digits and a minus before, or is out of bound from 64bits integer.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


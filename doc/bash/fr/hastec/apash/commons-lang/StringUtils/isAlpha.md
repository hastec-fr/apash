
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.isAlpha

Checks if the input string contains only Unicode letters.

## Overview

An empty string will return false.

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.isAlpha](#stringutilsisalpha)

### StringUtils.isAlpha

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | inString       | string        | in       |            | The string to check.                  |

#### Example

```bash
StringUtils.isAlpha ""            # false
StringUtils.isAlpha "     "       # false
StringUtils.isAlpha "abc"         # true
StringUtils.isAlpha "ab2c"        # false
StringUtils.isAlpha "ab-c"        # false
StringUtils.isAlpha "abéc"        # true
```

#### Exit codes

* **0**: If the input string contains only unicode letters
* **1**: contains other things than letters.

#### Output on stdout

* None.

#### Output on stderr

* None


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


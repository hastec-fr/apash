
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.repeat

repeats a string.

## Overview

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.repeat](#stringutilsrepeat)

### StringUtils.repeat

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | inNumber       | number        | in       |            | The number of time string is repeated.|
| $2     | inString       | string        | in       |            | The string to repeat.                 |

#### Example

```bash
StringUtils.repeat 3 "a"       # "aaa"
StringUtils.repeat 2 "ab"      # "abab"
```

#### Exit codes

* **0**: When result is displayed.
* **1**: Otherwise.

#### Output on stdout

* The repeated string.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


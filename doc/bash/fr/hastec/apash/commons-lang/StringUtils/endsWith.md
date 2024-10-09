
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.endsWith

Check if a string ends with a specified suffix.

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

* [StringUtils.endsWith](#stringutilsendswith)

### StringUtils.endsWith

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | inString       | string        | in       |            | Input string to check.                |
| $2     | inSuffix       | string        | in       |            | The suffix to find.                   |

#### Example

```bash
StringUtils.endsWith "" ""        # true
StringUtils.endsWith "abcd" ""    # true
StringUtils.endsWith "abcd" "cd"  # true
StringUtils.endsWith "abcd" "bd"  # false
StringUtils.endsWith ""     "c"   # false
```

#### Exit codes

* **0**: If the string ends with the suffix.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.

#### See also

* [StringUtils](../StringUtils.md)


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.isBlank

Checks if a string contains only whitespaces characters or is empty or not existing.

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

* [StringUtils.isBlank](#stringutilsisblank)

### StringUtils.isBlank

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | inString       | string        | in       |            | The string to check.                  |

#### Example

```bash
StringUtils.isBlank ""            # true
StringUtils.isBlank "     "       # true
StringUtils.isBlank "Hello World" # false
```

#### Exit codes

* **0**: If no argument or an agurment of length 0 is passed.
* **1**: If the argument with at lead one character (even space) is passed.

#### Output on stdout

* None.

#### Output on stderr

* None.

#### See also

* [StringUtils](../StringUtils.md)


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


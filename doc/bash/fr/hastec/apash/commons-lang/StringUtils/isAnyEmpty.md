
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.isAnyEmpty

Checks if one of the input string is empty ("").

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

* [StringUtils.isAnyEmpty](#stringutilsisanyempty)

### StringUtils.isAnyEmpty

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| ${@:1} | inStrings      | string...     | in       |            | The strings to check.                 |

#### Example

```bash
StringUtils.isAnyEmpty                  # true
StringUtils.isAnyEmpty ""               # true
StringUtils.isAnyEmpty "     "          # false
StringUtils.isAnyEmpty "Hello"          # false
StringUtils.isAnyEmpty ""        "foo"  # true
StringUtils.isAnyEmpty "bob"     ""     # true
StringUtils.isAnyEmpty "  bob  " ""     # true
StringUtils.isAnyEmpty " "       "bar"  # false
StringUtils.isAnyEmpty "foo"     "bar"  # false
```

#### Exit codes

* **0**: If at least one element is empty, or no element provided.
* **1**: If all arguments are not empty.

#### Output on stdout

* None.

#### Output on stderr

* None


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


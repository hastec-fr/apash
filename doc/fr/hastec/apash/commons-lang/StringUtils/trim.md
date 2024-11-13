
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.trim

Remove whitespaces characters from both ends of the input string.

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

* [StringUtils.trim](#stringutilstrim)

### StringUtils.trim

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | inString       | string        | in       |            | The string to trim.                   |

#### Example

```bash
StringUtils.trim ""                 # ""
StringUtils.trim "     "            # ""
StringUtils.trim "  Hello  World  " # "Hello  World"
```

#### Arguments

* **$1** (string): Input string to trim.

#### Exit codes

* **0**: If the string can be displayed.
* **1**: Otherwise.

#### Output on stdout

* the trimmed string

#### Output on stderr

* None


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


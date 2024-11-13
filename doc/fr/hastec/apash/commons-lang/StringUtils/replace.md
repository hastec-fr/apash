
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.replace

Replaces all occurrences of a String within another String.

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

* [StringUtils.replace](#stringutilsreplace)

### StringUtils.replace

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | inString       | string        | in       |            | The string to modify.                 |
| $2     | inSubstring    | string        | in       |            | The substring to search.              |
| $3     | inReplacement  | string        | in       |            | The string which replaces the substring found. |

#### Example

```bash
StringUtils.replace ""     ""    ""   # ""
StringUtils.replace ""     "a"   "d"  # ""
StringUtils.replace "any"  ""    "d"  # "any"
StringUtils.replace "any"  "a"   "de" # "deny"
StringUtils.replace "aba"  "a"   ""   # "b"
StringUtils.replace "aba"  "a"   "z"  # "zbz"
StringUtils.replace "aba"  "z"   "x"  # "aba"
```

#### Exit codes

* **0**: When result is displayed.
* **1**: otherwise.

#### Output on stdout

* The text with any replacements processed

#### Output on stderr

* None


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


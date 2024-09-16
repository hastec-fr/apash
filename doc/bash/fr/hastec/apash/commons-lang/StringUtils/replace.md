
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.replace

Replaces all occurrences of a String within another String.

## Overview

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.replace](#stringutilsreplace)

### StringUtils.replace

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

#### Arguments

* **$1** (string): The string to modify.
* **$2** (string): The substring to search.
* **$3** (string): The string which replaces the substring found.

#### Exit codes

* **0**: When result is displayed.
* **1**: otherwise.

#### Output on stdout

* The text with any replacements processed

#### Output on stderr

* None


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


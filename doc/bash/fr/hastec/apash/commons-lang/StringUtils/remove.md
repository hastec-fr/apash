
<div align="center" id="apash-top">
  <a href="https://github.com/hastec-fr/apash">
    <img alt="apash-logo" src="../../../../../../../assets/apash-logo.svg"/>
  </a>

  # Apash
</div>

# StringUtils.remove

Removes all occurrences of a substring from within the source string.

## Overview

An empty ("") source string will return the empty string.
An empty ("") remove string will return the source string.

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.remove](#stringutilsremove)

### StringUtils.remove

#### Example

```bash
StringUtils.remove ""                   ""       # ""
StringUtils.remove ""                   ":"      # ""
StringUtils.remove "queued"             ""       # "queued"
StringUtils.remove "queued"             "ue"     # "qd"
StringUtils.remove "abab::cd:ab:ef::ab" "ab"     # "::cd::ef::"
StringUtils.remove "queued"             "zz"     # "queued"
```

#### Arguments

* **$1** (string): The string to modify.
* **$2** (string): The substring to remove within the input string.

#### Exit codes

* **0**: When result is displayed.
* **1**: otherwise.

#### Output on stdout

* the substring with the string removed if found

#### Output on stderr

* None


  <div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>


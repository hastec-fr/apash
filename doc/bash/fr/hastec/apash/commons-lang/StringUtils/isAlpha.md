
<div align="center" id="apash-top">
  <a href="https://github.com/hastec-fr/apash">
    <img alt="apash-logo" src="../../../../../../../assets/apash-logo.svg"/>
  </a>

  # Apash
</div>

# StringUtils.isAlpha

Checks if the input string contains only Unicode letters.

## Overview

An empty string will return false.
### Authors:
* Benjamin VARGIN

## Index

* [StringUtils.isAlpha](#stringutilsisalpha)

### StringUtils.isAlpha

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

#### Example

```bash
StringUtils.isAlpha ""            # false
StringUtils.isAlpha "     "       # false
StringUtils.isAlpha "abc"         # true
StringUtils.isAlpha "ab2c"        # false
StringUtils.isAlpha "ab-c"        # false
StringUtils.isAlpha "abéc"        # true
```

#### Arguments

* **$1** (string): The string to evaluate

#### Exit codes

* **0**: If the input string contains only unicode letters
* **1**: contains other things than letters.

#### Output on stdout

* None

#### Output on stderr

* None


  <div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>


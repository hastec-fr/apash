
<div align="center" id="apash-top">
  <a href="https://github.com/hastec-fr/apash">
    <img alt="apash-logo" src="../../../../../../../assets/apash-logo.svg"/>
  </a>

  # Apash
</div>

# StringUtils.isBlank

Checks if a string contains only whitespaces characters or is empty or not existing.

## Overview

<!-- -->

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.isBlank](#stringutilsisblank)

### StringUtils.isBlank

#### Example

```bash
if StringUtils.isBlank ""           ; then echo "true"; else echo "false"; # true
if StringUtils.isBlank "     "      ; then echo "true"; else echo "false"; # true
if StringUtils.isBlank "Hello World"; then echo "true"; else echo "false"; # false
```

#### Arguments

* **$1** (string): The string to check.

#### Exit codes

* **0**: If no argument or an agurment of length 0 is passed.
* **1**: If the argument with at lead one character (even space) is passed.

#### Output on stdout

* None.

#### Output on stderr

* None.

#### See also

* [StringUtils](../StringUtils.md)


  <div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>


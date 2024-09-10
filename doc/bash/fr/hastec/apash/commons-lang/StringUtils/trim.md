# StringUtils.trim

Remove whitespaces characters from both ends of the input string.

## Overview

<!-- -->

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.trim](#stringutilstrim)

### StringUtils.trim

#### Example

```bash
StringUtils.trim ""                 # return ""
StringUtils.trim "     "            # return ""
StringUtils.trim "  Hello  World  " # return "Hello  World"
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


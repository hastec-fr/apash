# StringUtils.startsWith

Check if a CharSequence starts with a specified prefix.

## Overview

<!-- -->

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

Method description #########################################################

## Index

* [StringUtils.startsWith](#stringutilsstartswith)

### StringUtils.startsWith

#### Example

```bash
if StringUtils.startsWith "" ""        ; then echo "true"; else echo "false"; # true
if StringUtils.startsWith "abcd" ""    ; then echo "true"; else echo "false"; # true
if StringUtils.startsWith "abcd" "ab"  ; then echo "true"; else echo "false"; # true
if StringUtils.startsWith "abcd" "abd" ; then echo "true"; else echo "false"; # false
if StringUtils.startsWith ""     "a"   ; then echo "true"; else echo "false"; # false
```

#### Arguments

* **$1** (string): Input string to check
* **$2** (the): prefix to find

#### Exit codes

* **0**: If the string starts with the prefix
* **1**: Otherwise.

#### Output on stdout

* None

#### Output on stderr

* None


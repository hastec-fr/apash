
<div align="center" id="apash-top">
  <a href="https://github.com/hastec-fr/apash">
    <img alt="apash-logo" src="../../../../../../../assets/apash-logo.svg"/>
  </a>

  # Apash
</div>

# StringUtils.substring

Gets a substring from the specified String.

## Overview

Gets a substring from the specified String. The first character correspond
to the index 0. Negative index are possible, in this case, it counts from the end.
Any index minus 0 will be considered as 0 and any index over the length of the string
will be considered as the length of the string.
### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.substring](#stringutilssubstring)

### StringUtils.substring

#### Example

```bash
StringUtils.substring ""              # return ""
StringUtils.substring "abc"  0   2    # return "ab"
StringUtils.substring "abc" -2  -1    # return "b"
StringUtils.substring "abc" -4   2    # return "ab"
StringUtils.substring "abc"  2   6    # return "c"
```

#### Arguments

* **$1** (the): String to get the substring from
* **$2** (the): position to start from, negative means count back from the end of the String by this many characters
* **$3** (the): position to end at (exclusive), negative means count back from the end of the String by this many characters

#### Exit codes

* **0**: If the string can be displayed.
* **1**: Otherwise.

#### Output on stdout

* substring from start position to end position, empty if empty String input

#### Output on stderr

* None


  <div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>


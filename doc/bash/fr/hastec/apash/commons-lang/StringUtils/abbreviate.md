
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.abbreviate

Abbreviates a String using ellipses.

## Overview

This will turn "Now is the time for all good men" into "Now is the time for..."
!! WARNING !! The parameter order is not the same than in java to facilitate usage in bash
Translated the function from
[java documentation](https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/StringUtils.html#line.339)
### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.abbreviate](#stringutilsabbreviate)

### StringUtils.abbreviate

#### Example

```bash
StringUtils.abbreviate ""              # ""
StringUtils.abbreviate ""        4     # ""
StringUtils.abbreviate "abcdefg" 6     # "abc..."
StringUtils.abbreviate "abcdefg" 7     # "abcdefg"
StringUtils.abbreviate "abcdefg" 8     # "abcdefg"
StringUtils.abbreviate "abcdefg" 4     # "a..."
StringUtils.abbreviate "abcdefg" 3     # failure - ""
```

#### Arguments

* **$1** (string): The string to abbreviate.
* **$3** (string): The string used as replacement marker. (Default: "...")
* **$4** (string): Left edge of source String. (Default: 0)

#### Exit codes

* **0**: When result is displayed.
* **1**: when the width is not an integer or is too small.

#### Output on stdout

* The abbreviated string.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


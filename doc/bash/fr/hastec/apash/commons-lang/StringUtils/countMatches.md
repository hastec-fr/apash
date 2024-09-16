
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.countMatches

Counts how many times the substring appears in the larger string.

## Overview

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.countMatches](#stringutilscountmatches)

### StringUtils.countMatches

#### Example

```bash
StringUtils.countMatches ""     ""      # 0
StringUtils.countMatches ""     "a"     # 0
StringUtils.countMatches "abba"  ""     # 0
StringUtils.countMatches "abba"  "a"    # 2
StringUtils.countMatches "abba"  "ab"   # 1
StringUtils.countMatches "abba"  "xxx"  # 0
```

#### Arguments

* **$1** (string): The string to check.
* **$2** (string): The substring to count.

#### Exit codes

* **0**: When result is displayed.
* **1**: Otherwise.

#### Output on stdout

* The number of occurrences, 0 if either string is empty

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


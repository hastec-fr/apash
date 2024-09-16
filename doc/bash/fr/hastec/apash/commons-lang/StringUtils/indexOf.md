
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.indexOf

Finds the first index of a substring occurence within another string.

## Overview

<!-- -->

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.indexOf](#stringutilsindexof)

### StringUtils.indexOf

#### Example

```bash
StringUtils.indexOf ""         ""   #  0
StringUtils.indexOf "aabaabaa" ""   #  0
StringUtils.indexOf "aabaabaa" "b"  #  2
StringUtils.indexOf "aabaabaa" "ab" #  1
StringUtils.indexOf "aabaabaa" "mn" # -1
```

#### Arguments

* **$1** (string): The string to check.
* **$2** (string): The substring to find within the input string.

#### Exit codes

* **0**: If the index can be displayed.
* **1**: Otherwise.

#### Output on stdout

* The first index of the search, -1 if no match.

#### Output on stderr

* None

#### See also

* [StringUtils](../StringUtils.md)


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


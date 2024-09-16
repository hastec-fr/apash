
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.indexOfAny

Search a string to find the first index of any character in the given set of characters.

## Overview

<!-- -->

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.indexOfAny](#stringutilsindexofany)

### StringUtils.indexOfAny

#### Example

```bash
                    StringUtils.indexOfAny ""                 # -1
arr=("")          ; StringUtils.indexOfAny ""           arr   #  0
arr=("a")         ; StringUtils.indexOfAny ""           arr   # -1
arr=("cd" "ab" )  ; StringUtils.indexOfAny "zzabyycdxx" arr   #  2
arr=("zab" "aby") ; StringUtils.indexOfAny "zzabyycdxx" arr   #  1
```

#### Arguments

* **$1** (string): The string to check.

#### Exit codes

* **0**: If the index can be displayed.
* **1**: Otherwise.

#### Output on stdout

* The first minimum index matching researches, -1 if no match
  or empty input string or empty research.

#### Output on stderr

* None.

#### See also

* [indexOf](indexOf.md)
* [StringUtils](../StringUtils.md)


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


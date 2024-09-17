
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.endsWith

Check if a string ends with a specified suffix.

## Overview

<!-- -->

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.endsWith](#stringutilsendswith)

### StringUtils.endsWith

#### Example

```bash
StringUtils.endsWith "" ""        # true
StringUtils.endsWith "abcd" ""    # true
StringUtils.endsWith "abcd" "cd"  # true
StringUtils.endsWith "abcd" "bd"  # false
StringUtils.endsWith ""     "c"   # false
```

#### Arguments

* **$1** (string): Input string to check.
* **$2** (string): The suffix to find.

#### Exit codes

* **0**: If the string ends with the suffix.
* **1**: Otherwise.

#### Output on stdout

* None

#### Output on stderr

* None

#### See also

* [StringUtils](../StringUtils.md)


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


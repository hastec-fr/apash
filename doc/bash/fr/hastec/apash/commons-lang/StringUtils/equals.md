
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.equals

Compares two string, returning true if they represent equal sequences of characters.

## Overview

<!-- -->

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.equals](#stringutilsequals)

### StringUtils.equals

#### Example

```bash
if StringUtils.equals "" ""       ; then echo "true"; else echo "false"; # true
if StringUtils.equals "abc" "abc" ; then echo "true"; else echo "false"; # true
if StringUtils.equals "abc" "abcd"; then echo "true"; else echo "false"; # false
```

#### Arguments

* **$1** (string): First string to compare.
* **$2** (string): Second string to compare.

#### Exit codes

* **0**: If the string are equal (case-sensitive), or both empty.
* **1**: Otherwise.

#### Output on stdout

* None

#### Output on stderr

* None

#### See also

* [StringUtils](../StringUtils.md)


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# NumberUtils.isParsable

Checks whether the given String is a parsable number.

## Overview

Parsable numbers include those Strings having potential minus in front,
only digits and a potential ".". Hexadecimal and scientific notations are not considered parsable

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [NumberUtils](../NumberUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [NumberUtils.isParsable](#numberutilsisparsable)

### NumberUtils.isParsable

#### Example

```bash
NumberUtils.isParsable  ""       # false
NumberUtils.isParsable  "a"      # false
NumberUtils.isParsable  "a12"    # false
NumberUtils.isParsable  "-12"    # true
NumberUtils.isParsable  "--12"   # false
NumberUtils.isParsable  "1-2"    # false
NumberUtils.isParsable  "1.2"    # true
NumberUtils.isParsable  " 12"    # false
NumberUtils.isParsable  "123"    # true
NumberUtils.isParsable  "000"    # true
NumberUtils.isParsable  "1."     # false
NumberUtils.isParsable  ".1"     # true
```

#### Arguments

* **$1** (number): The number to analyze.

#### Exit codes

* **0**: When the input string is a parsable number.
* **1**: When the input string contains characters other than digits and a minus before

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


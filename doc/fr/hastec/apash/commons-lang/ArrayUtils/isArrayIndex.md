
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.isArrayIndex

Check if the given index is a long positive integer.

## Overview

Mark bounds of an array for 64bits systems (from 0 to Long_MAX_VALUE).
This function does not return if the array has the index, for that please 
check the function isArrayIndexValid.

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.isArrayIndex](#arrayutilsisarrayindex)

### ArrayUtils.isArrayIndex

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                          |
|--------|----------------|---------------|----------|------------|--------------------------------------|
| $1     | inIndex        | number        | in       |            | The index number to analyse          |

#### Example
```bash
ArrayUtils.isArrayIndex "0"                    # true (false for zsh starting at 1)
ArrayUtils.isArrayIndex "1"                    # true
ArrayUtils.isArrayIndex "9223372036854775807"  # true
ArrayUtils.isArrayIndex "9223372036854775808"  # false
ArrayUtils.isArrayIndex "-1"                   # false
ArrayUtils.isArrayIndex "1.2"                  # false
ArrayUtils.isArrayIndex "a"                    # false
ArrayUtils.isArrayIndex                        # false
```

#### Exit codes

* **0**: Whether the given index is a long positive number.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


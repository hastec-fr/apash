
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.containsOnly

Checks if the CharSequence contains only certain characters.

## Overview

Checks if the CharSequence contains only certain characters.
An empty input string returns always true.
An empty sequence of character to search with a non empty input 
string returns false.

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.containsOnly](#stringutilscontainsonly)

### StringUtils.containsOnly

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | inString       | string        | in       |            | The string to check.                  |
| $2     | inSequence     | string        | in       |            | The sequence of characters which should compose the input string. |

#### Example

```bash
   StringUtils.constainsOnly ""     ""     # true
   StringUtils.constainsOnly ""     "ab"   # true
   StringUtils.constainsOnly "ab"   ""     # false
   StringUtils.constainsOnly "abab" "abc"  # true
   StringUtils.constainsOnly "ab1"  "abc"  # false
   StringUtils.constainsOnly "abz"  "abc"  # false

@stdout None.
@stderr None
```

#### Exit codes

* **0**: True if the input string contains only provided characters.
* **1**: Otherwise.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


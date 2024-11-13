
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.split

Splits the provided text into an array.

## Overview

Non array reference will be transformed to empty array.
Splits the provided text into an array. Default separator is " "
The separator is not included in the returned String array.
Adjacent separators are treated as one separator. Leading and tailing separators
are not considered.

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.split](#stringutilssplit)

### StringUtils.split

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | outArrayName   | string[]      | out      |            | The result array which will contains tokens.     |
| $2     | inString       | string        | in       |            | The string to split.                             |
| $3     | inDelimiter    | string        | in       | " "        | The delimiter (can be a sequence of characters). |

#### Example

```bash
StringUtils.split myArray ""  ""                    # []
StringUtils.split myArray ""  ":"                   # []
StringUtils.split myArray "ab:cd:ef" ""             # ["ab:cd:ef"]
StringUtils.split myArray "::ab::cd:::ef::" ":"     # ["ab", "cd", "ef"]
StringUtils.split myArray $'ab\n\ncd\nef' $'\n'     # ["ab", "cd", "ef"]
StringUtils.split myArray "abab::cd:ab:ef::ab" "ab" # ["::cd:", ":ef::"]
```

#### Exit codes

* **0**: When result array exists.
* **1**: When input array does not exists.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


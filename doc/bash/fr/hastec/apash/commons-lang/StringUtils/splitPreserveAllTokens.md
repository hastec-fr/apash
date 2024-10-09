
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# StringUtils.splitPreserveAllTokens

Splits the provided text into an array preserving all tokens.

## Overview

Splits the provided text into an array.eparators specified, 
preserving all tokens, including empty tokens created by adjacent separators.
The separator is not included in the returned String array. 
Adjacent separators are treated as separators for empty tokens

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.splitPreserveAllTokens](#stringutilssplitpreservealltokens)

### StringUtils.splitPreserveAllTokens

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | inArrayName    | string[]      | out      |            | The result array which will contains tokens.     |
| $2     | inString       | string        | in       |            | The string to split.                             |
| $3     | inDelimiter    | string        | in       | " "        | The delimiter (can be a sequance of characters). |

#### Example

```bash
StringUtils.splitPreserveAllTokens myArray ""  ""                    # []
StringUtils.splitPreserveAllTokens myArray ""  ":"                   # []
StringUtils.splitPreserveAllTokens myArray "ab:cd:ef" ""             # ["ab:cd:ef"]
StringUtils.splitPreserveAllTokens myArray "::ab::cd:ef::" ":"       # ["", "", "ab", "", "cd", "ef", ""]
StringUtils.splitPreserveAllTokens myArray $'ab\n\ncd\nef' $'\n'     # ["ab", "", "cd", "ef"]
StringUtils.splitPreserveAllTokens myArray "abab::cd:ab:ef::ab" "ab" # ["", "", "::cd:", ":ef::", ""]
```

#### Exit codes

* **0**: When result array exists.
* **1**: When input array does not exists.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



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

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [StringUtils.splitPreserveAllTokens](#stringutilssplitpreservealltokens)

### StringUtils.splitPreserveAllTokens

#### Example

```bash
StringUtils.splitPreserveAllTokens myArray ""  ""                    # []
StringUtils.splitPreserveAllTokens myArray ""  ":"                   # []
StringUtils.splitPreserveAllTokens myArray "ab:cd:ef" ""             # ["ab:cd:ef"]
StringUtils.splitPreserveAllTokens myArray "::ab::cd:ef::" ":"       # ["", "", "ab", "", "cd", "ef", ""]
StringUtils.splitPreserveAllTokens myArray $'ab\n\ncd\nef' $'\n'     # ["ab", "", "cd", "ef"]
StringUtils.splitPreserveAllTokens myArray "abab::cd:ab:ef::ab" "ab" # ["", "", "::cd:", ":ef::", ""]
```

#### Arguments

* **$1** (string[]): The result array which will contains tokens.
* **$2** (string): The string to split.
* **$3** (string): The delimiter (can be a sequance of characters).

#### Exit codes

* **0**: When result array exists.
* **1**: When input array does not exists.

#### Output on stdout

* None

#### Output on stderr

* None


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


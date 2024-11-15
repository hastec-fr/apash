
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# StringUtils.splitPreserveAllTokens
Splits the provided text into an array preserving all tokens.
## Description
   Splits the provided text into an array.eparators specified, 
   preserving all tokens, including empty tokens created by adjacent separators.
   The separator is not included in the returned String array. 
   Adjacent separators are treated as separators for empty tokens.<br/>
   @todo: Optimize this function.

## History
### Since
  * 0.1.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                           |
 |--------|----------------|---------------|----------|------------|---------------------------------------|
 | $1     | outArrayName    | string[]      | out      |            | The result array which will contains tokens.     |
 | $2     | inString       | string        | in       |            | The string to split.                             |
 | $3     | inDelimiter    | string        | in       | " "        | The delimiter (can be a sequance of characters). |

### Example
 ```bash
    StringUtils.splitPreserveAllTokens myArray ""  ""                    # []
    StringUtils.splitPreserveAllTokens myArray ""  ":"                   # []
    StringUtils.splitPreserveAllTokens myArray "ab:cd:ef" ""             # ["ab:cd:ef"]
    StringUtils.splitPreserveAllTokens myArray "::ab::cd:ef::" ":"       # ["", "", "ab", "", "cd", "ef", ""]
    StringUtils.splitPreserveAllTokens myArray $'ab\n\ncd\nef' $'\n'     # ["ab", "", "cd", "ef"]
    StringUtils.splitPreserveAllTokens myArray "abab::cd:ab:ef::ab" "ab" # ["", "", "::cd:", ":ef::", ""]
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When result array exists.
  * **1**: When input array does not exists.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


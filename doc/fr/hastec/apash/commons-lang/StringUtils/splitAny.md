
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# StringUtils.splitAny
Splits the provided text into an array according to the multiple inputs strings.
## Description
   Non array reference will be transformed to empty array.
   Default separator is " "
   The separator is not included in the returned String array.
   Adjacent separators are treated as one separator. Leading and tailing separators
   are not considered. Strings are split in the order of the matching. <br/>
   @todo: Optimize this function.

## History
### Since
  * 0.2.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                           |
 |--------|----------------|---------------|----------|------------|---------------------------------------|
 | $1     | outArrayName   | string[]      | out      |            | The result array which will contains tokens.     |
 | $2     | apash_inString       | string        | in       |            | The string to split.                             |
 | $3     | apash_inDelimiters   | string...     | in       | " "        | The delimiter (can be a sequence of characters). |

### Example
 ```bash
    StringUtils.split myArray "ab:c,apash_d:e,f" ":" ","           # ["ab", c, apash_d, e, f ]
    StringUtils.split myArray ":,:ab::c,apash_d:::e,f:,:" ":" ","  # ["ab", c, apash_d, e, f ]
    StringUtils.split myArray $'ab\n\ncd\nef' $'\n'          # ["ab", "cd", "ef"]
    StringUtils.split myArray "abab::cd:ab:ef::ab" "ab"      # ["::cd:", ":ef::"]
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When result array exists.
  * **1**: When input array does not exists.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# StringUtils.abbreviate
Abbreviates a String using ellipses.
## Description
   This will turn "Now is the time for all good men" into "Now is the time for..."
   !! WARNING !! The parameter order is not the same than in java to facilitate usage in bash
   Translated the function from
   [java documentation](https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/StringUtils.html#line.339)

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
 | $1     | inString       | string        | in       |            | The string to abbreviate.             |
 | $2     | inMaxWidth     | number        | in       |            | Maximum length of result string, must be at least 4. |
 | $3 ?   | inOffsets      | number        | in       | 0          | Left edge of source String.                          |
 | $4 ?   | inMarker       | string        | in       | ...        | The string used as replacement marker.               |

### Example
 ```bash
    StringUtils.abbreviate ""              # ""
    StringUtils.abbreviate ""        4     # ""
    StringUtils.abbreviate "abcdefg" 6     # "abc..."
    StringUtils.abbreviate "abcdefg" 7     # "abcdefg"
    StringUtils.abbreviate "abcdefg" 8     # "abcdefg"
    StringUtils.abbreviate "abcdefg" 4     # "a..."
    StringUtils.abbreviate "abcdefg" 3     # failure - ""
 ```

### Stdout
  * The abbreviated string.
### Stderr
  * None.

### Exit codes
  * **0**: When result is displayed.
  * **1**: when the width is not an integer or is too small.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# StringUtils.indexOfAny
Search a string to find the first index of any character in the given set of characters.

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
 | $1     | inString       | string        | in       |            | The string to check.                  |

### Example
 ```bash
                        StringUtils.indexOfAny ""                 # -1
    arr=("")          ; StringUtils.indexOfAny ""           arr   #  0
    arr=("a")         ; StringUtils.indexOfAny ""           arr   # -1
    arr=("cd" "ab" )  ; StringUtils.indexOfAny "zzabyycdxx" arr   #  2
    arr=("zab" "aby") ; StringUtils.indexOfAny "zzabyycdxx" arr   #  1
 ```

### Stdout
  * The first minimum index matching researches, -1 if no match
         or empty input string or empty research.
### Stderr
  * None.

### Exit codes
  * **0**: If the index can be displayed.
  * **1**: Otherwise.

 Note for passing array by reference
### See also
  * [indexOf](indexOf.md)
### See also
  * https://stackoverflow.com/questions/10953833/passing-multiple-distinct-arrays-to-a-shell-function

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


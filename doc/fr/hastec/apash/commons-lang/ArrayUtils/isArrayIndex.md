
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.isArrayIndex
Check if the given index is a long positive integer.
## Description
   Mark bounds of an array for 64bits systems (from 0 to Long_MAX_VALUE).
   This function does not return if the array has the index, for that please 
   check the function isArrayIndexValid.

## History
### Since
  * 0.2.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.packageEnd -->

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

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: Whether the given index is a long positive number.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


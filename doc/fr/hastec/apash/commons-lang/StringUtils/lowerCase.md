
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# StringUtils.lowerCase
Converts a String to lower case.

## History
### Since
  * 0.1.0 (hastec-fr)

### ChangeLogs:
 - 0.2.0: Split file to .bash, .zsh and bash_4.2.53. Let the nearest POSIX code in .sh.

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [StringUtils](../StringUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                           |
 |--------|----------------|---------------|----------|------------|---------------------------------------|
 | $1     | inString       | string        | in       |            | The string to lower case.             |

### Example
 ```bash
    StringUtils.upperCase ""              # ""
    StringUtils.upperCase "ABC"           # "abc"
    StringUtils.upperCase "AbC"           # "abc"
    StringUtils.upperCase "A123B"         # "a123b"
    StringUtils.upperCase "abc"           # "abc"
    StringUtils.upperCase "CRÈME BRÛLÉE"  # "crème brûlée"
 ```

### Stdout
  * The lower cased string
### Stderr
  * None.

### Exit codes
  * **0**: When result is displayed.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


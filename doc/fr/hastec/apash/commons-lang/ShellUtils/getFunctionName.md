
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ShellUtils.getFunctionName
Display the name of the function according to the provided depth
## Description
   Bash and zsh provide stack of the called function with environment variables ($FUNCNAME and $funcstack).
   By default, the caller of this function is retreived (depth=1).

## History
### Since
  * 0.2.0 (hastec-fr)
 
## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ShellUtils](../ShellUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                           |
 |--------|----------------|---------------|----------|------------|---------------------------------------|
 | $1     | inDepth        | string        | in       | APASH_ARRAY_FIRST_INDEX+1 | The depth of the function to retreive.|

### Example
 ```bash
    ShellUtils.getFunctionName  0                          # ShellUtils.getFunctionName
    myCaller(){ ShellUtils.getFunctionName   ; }; myCaller # myCaller
    myCaller(){ ShellUtils.getFunctionName  1; }; myCaller # myCaller
 ```
### Implementation note
 No check on system array (funcstack not detected as an array).

### Stdout
  * The function name.
### Stderr
  * None.

### Exit codes
  * **0**: When the function name is returned.
  * **1**: When the index is not valid.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


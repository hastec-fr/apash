
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ShellUtils.getLineNumber
Display the line number of the executed function.
## Description
   Bash provides stack of the called function with environment variables ($BASH_LINENO)
   Other shells must provide the current line number of the caller with $LINENO.

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
    ShellUtils.getLineNumber  0                          # ShellUtils.getLineNumber
    myCaller(){ ShellUtils.getLineNumber   ; }; myCaller # myCaller
    myCaller(){ ShellUtils.getLineNumber  1; }; myCaller # myCaller
 ```

### Stdout
  * The function name.
### Stderr
  * None.

### Exit codes
  * **0**: When the function name is returned.
  * **1**: When the index is not valid.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


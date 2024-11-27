
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ShellUtils.getParentFunctionName
Display the name of the parent function of the current executed function.
## Description
   If no parent of the calling function exists, then return empty.
   It's equivalent of: ShellUtils.getFunctionName 2

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

### Example
 ```bash
    ShellUtils.getParentFunctionName                                 # failure - ""
    myCaller(){ ShellUtils.getParentFunctionName ; }; myCaller       # failure - ""
    myGrandCaller() { myCaller                  ; }; myGrandCaller  # success - "myGrandCaller"
 ```

### Stdout
  * The name of the parent function of the current executed function.
### Stderr
  * None.

### Exit codes
  * **0**: When the input name corresponds to a variable (not including arrays and maps).
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


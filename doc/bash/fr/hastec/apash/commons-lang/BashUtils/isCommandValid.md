
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# BashUtils.isCommandValid

Defensive programming technique to check that a variable name is valid

## Overview

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [BashUtils](../BashUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [BashUtils.isCommandValid](#bashutilsiscommandvalid)

### BashUtils.isCommandValid

#### Example
```bash
BashUtils.isCommandValid  ""                # false
BashUtils.isCommandValid  "apashnotexist"   # false
BashUtils.isCommandValid  "command"         # true
```

#### Arguments

* **$1** (string): Command to analyse

#### Exit codes

* **0**: When the command name is correct.
* **1**: Otherwise.

#### Output on stdout

* None

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


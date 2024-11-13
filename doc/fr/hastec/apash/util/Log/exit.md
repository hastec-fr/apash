
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# Log.exit

Log message before exiting from the calling function.

## Overview

The message is mandatory pushed to error channel.

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [util](../../util.md) / [Log](../Log.md) / 
<!-- apash.parentEnd -->

## Index

* [Log.exit](#logexit)

### Log.exit

#### Arguments
| #      | varName        | Type          | in/out   | Default   | Description                           |
|--------|----------------|---------------|----------|-----------|---------------------------------------|
| $1     | inLineNumber   | number        | in       |           | The line number of the log.           |
| $2     | inLabel        | string        | in       |           | The corresponding exit label.         |

#### Example

```bash
Log.exit "$LINENO" "StringUtils.leftPad-002" # &2: 2024-11-06T08:27:11.213+0000 [TRACE] StringUtils.leftPad (7): Out StringUtils.leftPad-002
```

#### Exit codes

* **0**: When the message has been logged.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* The message to log.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


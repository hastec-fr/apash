
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# Log.entry

Log the parent function call with its arguments.

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

* [Log.entry](#logentry)

### Log.entry

#### Arguments
| #      | varName        | Type          | in/out   | Default   | Description                           |
|--------|----------------|---------------|----------|-----------|---------------------------------------|
| $1     | inLineNumber   | number        | in       |           | The line number of the log.           |
| $2     | inMessage      | string        | in       |           | The message to log.                   |

#### Example

```bash
Log.debug $LINENO "Hello World"  # &2: 2024-11-06T08:27:11.213+0000 [DEBUG] apash (1): Hello World
```

#### Exit codes

* **0**: When the message has been logged.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* The message to log.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


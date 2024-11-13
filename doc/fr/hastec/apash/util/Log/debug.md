
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# Log.debug

Log a message with debug level

## Overview

By default the message is pushed to the error channel.

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [util](../../util.md) / [Log](../Log.md) / 
<!-- apash.parentEnd -->

## Index

* [Log.debug](#logdebug)

### Log.debug

#### Arguments
| #      | varName        | Type          | in/out   | Default   | Description                           |
|--------|----------------|---------------|----------|-----------|---------------------------------------|
| $1     | inLineNumber   | number        | in       |           | The line number of the log.           |
| $2     | inMessage      | string        | in       |           | The message to log.                   |
| $3     | inFunction     | string        | in       | apash     | The corresponding module of the log.  |
| $4     | inChannel      | number        | in       | 2         | The number to check.                  |

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


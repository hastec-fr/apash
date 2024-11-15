
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# Log.warn
Log a message with warn level.
## Description
   By default the message is pushed to the error channel.

## History
### Since
  * 0.2.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [util](../../util.md) / [Log](../Log.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default   | Description                           |
 |--------|----------------|---------------|----------|-----------|---------------------------------------|
 | $1     | inLineNumber   | number        | in       |           | The line number of the log.           |
 | $2     | inMessage      | string        | in       |           | The message to log.                   |
 | $3     | inFunction     | string        | in       | apash     | The corresponding module of the log.  |
 | $4     | inChannel      | number        | in       | 2         | The number to check.                  |

### Example
 ```bash
    Log.info $LINENO "Behind you!!"  # &2: 2024-11-06T08:27:11.213+0000 [WARN] apash (1): Behind you!!
 ```

### Stdout
  * None.
### Stderr
  * The message to log.

### Exit codes
  * **0**: When the message has been logged.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


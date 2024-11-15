
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# LogUtils.logger
Log a message with all provided informations.
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
 | #      | varName        | Type          | in/out   | Default    | Description                           |
 |--------|----------------|---------------|----------|------------|---------------------------------------|
 | $1     | inLevel        | string        | in       |            | The message to log.                   |
 | $2     | inFunction       | string        | in       |            | The corresponding module of the log.  |
 | $3     | inLineNumber   | number        | in       |            | The line number of the log.           |
 | $4     | inMessage      | string        | in       |            | The message to log.                   |
 | $5     | inChannel      | number        | in       | 2          | The number to check.                  |

### Example
 ```bash
    LogUtils.logger $APASH_LOG_LEVEL_INFO apash $LINENO "Hello World"  # &2: 2024-11-06T08:27:11.213+0000 [INFO] apash (1): Hello World
 ```

### Stdout
  * None.
### Stderr
  * The message to log (if the channel has not been changed).

### Exit codes
  * **0**: When the message has been logged.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


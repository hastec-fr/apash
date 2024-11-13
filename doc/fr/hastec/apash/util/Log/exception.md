
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# Log.exception

Log an error message due to an unexpected behavior and print the stack.

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

* [Log.exception](#logexception)

### Log.exception

#### Arguments
| #      | varName        | Type          | in/out   | Default   | Description                           |
|--------|----------------|---------------|----------|-----------|---------------------------------------|
| $1     | inLineNumber   | number        | in       |           | The line number of the log.           |
| $2     | inLabel        | string        | in       |           | The corresponding exit label.         |

#### Example

```bash
cat <<EOF
apash.import fr.hastec.apash.util.Log.exception
myFunc() { Log.exception "$LINENO" "myFunc-001" "InvalidNumber"; }
myGrandFunc() { 
    echo test
    myFunc;
}
EOF > test.sh && chmod +x test.sh

./test.sh     # &2: 2024-11-06T08:27:11.213+0000 [TRACE] myFunc (2): Exception InvalidNumber at myFunc-001
              #       at myFunc(./test.sh:2)
              #       at myGrandFunc(./test.sh:5)
              #       at main(./test.sh:8)
```

#### Exit codes

* **0**: When the message has been logged.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* The message to log.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


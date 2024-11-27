
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ApashUtils.doc
Generate a markdown file(.md) according to comments of the input file.
## Description
   Markdown is generated according to comments between tags: "##/" and "#/".<br/>
   For multi lines, all # in the middle will be considered in the current documentation.
   ```bash
   ##/
   #  My first comment line
   #  My second comment line
   #/
   ```

## History
### Since
  * 0.2.0

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ApashUtils](../ApashUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #  | varName        | Type          | in/out   | Default    | Description                          |
 |----|----------------|---------------|----------|------------|--------------------------------------|
 | $1 | inFile         | string        | in       |            | Path of the file to analyze.         |

### Example
 ```bash
    ApashUtils.doc  "myFile"    # Display the markdown section to the standard output.
 ```

### Stdout
  * The markdown content of the input file.
### Stderr
  * None.

### Exit codes
  * **0**: When markdown is displayed.
  * **1**: When the file does not exist.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


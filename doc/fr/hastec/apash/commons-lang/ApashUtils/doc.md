
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ApashUtils.doc
Create a Markdown file associated to the input file.
## Description
   Tags must be in comment sections and between tags: ##/ ... #/<br/>
   For multi lines, all # in the middle will be considered in the current documentation.
   ```bash
   ##/
   #  My first comment line
   #  My second comment line
   #/
   ```
## History
### Since
- 0.2.0

### Authors:
 * 0.2.0: hastec-fr

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ApashUtils](../ApashUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #  | varName        | Type          | in/out   | Default    | Description                          |
 |----|----------------|---------------|----------|------------|--------------------------------------|
 | $1 | ioArrayName    | ref(string[]) | in & out |            | Name of the array to modify.         |
 | $2 | inValue        | string        | in       |            | Value to add at the end of the array.|

### Example
 ```bash
    ApashUtils.doc  "myFile"    # Display the markdown content.
 ```

### Stdout
- The markdown content of the input file.
### Stderr
- None.

### Exit codes
* **0**: When markdown is displayed.
* **1**: When the file does not exists.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


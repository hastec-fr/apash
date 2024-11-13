
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

### Changelogs:
 * 0.2.0: blabla

### Authors:
 * 0.2.0: hastec-fr

## Interface
### Packages
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ApashUtils](../ApashUtils.md) / 
<!-- apash.parentEnd -->

### Arguments
 | #  | varName        | Type          | in/out   | Default    | Description                          |
 |----|----------------|---------------|----------|------------|--------------------------------------|
 | $1 | ioArrayName    | ref(string[]) | in & out |            | Name of the array to modify.         |
 | $2 | inValue        | string        | in       |            | Value to add at the end of the array.|

### Example
 ```bash
    ArrayUtils.add  "myArray"              # failure
    ArrayUtils.add  "myArray"  "a"         # ("a")
    ArrayUtils.add  "myArray"  "b"         # ("a" "b")
    ArrayUtils.add  "myArray"  ""          # ("a" "b" "")
    ArrayUtils.add  "myArray"  "foo bar"   # ("a" "b" "" "foo bar")
    ArrayUtils.add  "myArray"  "c" "d"     # failure
 ```

### Stdout
- None.
### Stderr
- None.

### See also
- For adding element in the middle of an array, please check [insert](./insert.md) method.

### Exit codes
* **0**: When first argument is an array and the value is not an embedded array or map.
* **1**: Otherwise.

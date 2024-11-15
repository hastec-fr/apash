
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.addFirst
Adds given elements at the beginning of an array.
## Description
   The array is automatically created if the variable is not declared.
   Existing variables or maps are not overriden and the function fails.

## History
### Since
  * 0.1.0 (hastec-fr)

### ChangeLogs:
  * 0.2.0 (hastec-fr):  Consider no argument as success (nothing added).

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName           | Type          | in/out   | Default    | Description                          |
 |--------|-------------------|---------------|----------|------------|--------------------------------------|
 | $1     | apash_ioArrayName | ref(string[]) | in & out |            | Name of the array to modify.         |
 | $2     | apash_inValue     | string...     | in       |            | Value to add at the beginning of the array.|

### Example
 ```bash
    ArrayUtils.addFirst  "myArray"              # ()
    ArrayUtils.addFirst  "myArray"  "a"         # ("a")
    ArrayUtils.addFirst  "myArray"  "b"         # ("b" "a")
    ArrayUtils.addFirst  "myArray"  ""          # ("" "a" "b")
    ArrayUtils.addFirst  "myArray"  "c" "d"     # failure
    ArrayUtils.addFirst  "myArray"  "foo bar"   # ("foo bar" "" "b" "a")
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When first argument is an array and a value must be added.
  * **1**: When none or more than 1 value must be added.

### See also
  * [ArrayUtil.insert](./insert.md): Adding multiple element in the middle of an array.
  * [ArrayUtil.add](./add.md): Adding a single elements at the end of an array.
  * [ArrayUtil.addAll](./addAll.md): Adding multiple elements at the end of an array.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


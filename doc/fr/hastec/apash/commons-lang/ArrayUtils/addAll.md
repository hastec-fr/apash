
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.addAll
Adds given elements at the end of an array.
## Description
   The array is automatically created if the variable is not declared.
   Existing variables or maps are not overriden and the function fails.

## History
### Since
  * 0.1.0 (hastec-fr)

### ChangeLogs:
  * 0.2.0 (hastec-fr):
    * Fix issue with discontinued indexes in bash.
    * Consider no argument as success (nothing added).

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName           | Type          | in/out   | Default    | Description                           |
 |--------|-------------------|---------------|----------|------------|---------------------------------------|
 | $1     | apash_ioArrayName | ref(string[]) | in & out |            | Name of the array to modify.          |
 | ${@:2} | $@                | string...     | in       |            | Values to add at the end of the array.|

### Example
 ```bash
    ArrayUtils.addAll  "myArray"              # ()
    ArrayUtils.addAll  "myArray"  "a"         # ("a")
    ArrayUtils.addAll  "myArray"  "b" ""      # ("a" "b" "")
    ArrayUtils.addAll  "myArray"  "c" "d"     # ("a" "b" "" "c" "d")
    ArrayUtils.addAll  "myArray"  "foo bar"   # ("a" "b" "" "c" "d" "foo bar")

    myArray=("a" "b")
    myArray[APASH_ARRAY_FIRST_INDEX+3]="x"
    ArrayUtils.addAll  "myArray" "foo bar" "z"   # ("a" "b" "" "x" "foo bar" "z")
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When first argument is an array and at least one value is provided.
  * **1**: Otherwise.

### See also
  * [ArrayUtil.insert](./insert.md): Adding multiple element in the middle of an array.
  * [ArrayUtil.add](./add.md): Adding a single elements at the end of an array.
  * [ArrayUtil.addFirst](./addFirst.md): Adding an element at the beginning of an array.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


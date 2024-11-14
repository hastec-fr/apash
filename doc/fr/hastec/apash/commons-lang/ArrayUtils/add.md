
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.add
Adds a given element at the end of an array.
## Description
   The array is automatically created if the variable is not declared.
   Existing variables or maps are not overriden and the function fails.

## History
### Since
  * 0.1.0 (hastec-fr)

### Changelogs:
  * 0.2.0 (hastec-fr):
    * Fix issue with discontinued indexes in bash.
    * Consider no argument as success (nothing added).

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #  | varName           | Type          | in/out   | Default    | Description                          |
 |----|-------------------|---------------|----------|------------|--------------------------------------|
 | $1 | apash_ioArrayName | ref(string[]) | in & out |            | Name of the array to modify.         |
 | $2 | apash_inValue     | string        | in       |            | Value to add at the end of the array.|

### Example
 ```bash
    ArrayUtils.add  "myArray"              # ()
    ArrayUtils.add  "myArray"  "a"         # ("a")
    ArrayUtils.add  "myArray"  "b"         # ("a" "b")
    ArrayUtils.add  "myArray"  ""          # ("a" "b" "")
    ArrayUtils.add  "myArray"  "foo bar"   # ("a" "b" "" "foo bar")
    ArrayUtils.add  "myArray"  "c" "d"     # failure
    
    myArray[APASH_ARRAY_FIRST_INDEX+5]="x"
    ArrayUtils.add  "myArray"  "z"         # ("a" "b" "" "foo bar" "" "x" "z")
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When first argument is an array.
  * **1**: Otherwise.

### See also
  * [ArrayUtil.insert](./insert.md): Adding multiple element in the middle of an array.
  * [ArrayUtil.addAll](./addAll.md): Adding multiple elements at the end of an array.
  * [ArrayUtil.addFirst](./addFirst.md): Adding an element at the beginning of an array.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


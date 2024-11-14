
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.insert
Inserts elements into an array at the given index (starting from zero).

## History
### Since
  * 0.2.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.packageEnd -->

#### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                          |
 |--------|----------------|---------------|----------|------------|--------------------------------------|
 | $1     | inIndex        | number        | in       |            | Positive index of the array to insert values. |
 | $2     | ref_ArrayUtilsInsert_ioArrayName    | ref(string[]) | in       |            | Name of the array to modify.                  |
 | ${@:3} | inValues       | string...     | in       |            | Values to insert at the indicated index.      |

#### Example
 ```bash
    myArray=()
    ArrayUtils.insert  "0"           "myArray"              # () - failure
    ArrayUtils.insert  "0"           "myArray"  "a"         # ("a")
    ArrayUtils.insert  "${#ioArray}" "myArray"  "b" ""      # ("a" "b" "")
    ArrayUtils.insert  "2"           "myArray"  "c" "d"     # ("a" "b" "c" "d" "")
    ArrayUtils.insert  "1"           "myArray"  "foo bar"   # ("a" "foo bar" "b" "c" "d" "")
    ArrayUtils.insert  "-1"          "myArray" "test"       # ("a" "foo bar" "b" "c" "d" "") - failure
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: When all elements are inserted.
  * **1**: When the index is not a positive number or reference is not an array or there are no value to insert.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


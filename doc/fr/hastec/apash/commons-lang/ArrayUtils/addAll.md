
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.addAll

Adds given elements at the end of an array.

## Overview

The array is automatically created if the variable is not declared.
Existing variables or maps are not overriden and the function fails.

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.addAll](#arrayutilsaddall)

### ArrayUtils.addAll

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | ioArrayName    | ref(string[]) | in & out |            | Name of the array to modify.          |
| ${@:2} | inValues       | string...     | in       |            | Values to add at the end of the array.|

#### Example
```bash
ArrayUtils.addAll  ""       ""            # failure

myVar="test"
ArrayUtils.addAll  "myVar"  "a"           # failure

declare -A myMap
ArrayUtils.addAll  "myMap"  "a"           # failure

myArray=()
ArrayUtils.addAll  "myArray"              # failure
ArrayUtils.addAll  "myArray"  "a"         # ("a")
ArrayUtils.addAll  "myArray"  "b" ""      # ("a" "b" "")
ArrayUtils.addAll  "myArray"  "c" "d"     # ("a" "b" "" "c" "d")
ArrayUtils.addAll  "myArray"  "foo bar"   # ("a" "b" "" "c" "d" "foo bar")
```

#### Exit codes

* **0**: When first argument is an array and at least one value is provided.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.

#### See also

* For adding element in the middle of an array, please check [insert](./insert.md) method.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.addFirst

Adds given elements at the beginning of an array.

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

* [ArrayUtils.addFirst](#arrayutilsaddfirst)

### ArrayUtils.addFirst

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                          |
|--------|----------------|---------------|----------|------------|--------------------------------------|
| $1     | ioArrayName    | ref(string[]) | in & out |            | Name of the array to modify.         |
| ${@:2} | inValues       | string...    | in       |            | Value to add at the beginning of the array.|

#### Example
```bash
ArrayUtils.addFirst  ""       ""          # failure

myVar="test"
ArrayUtils.addFirst  "myVar"  "a"         # ("a")

declare -A myMap
ArrayUtils.addFirst  "myMap"  "a"         # ("a")

myArray=()
ArrayUtils.addFirst  "myArray"              # failure
ArrayUtils.addFirst  "myArray"  "a"         # ("a")
ArrayUtils.addFirst  "myArray"  "b"         # ("b" "a")
ArrayUtils.addFirst  "myArray"  ""          # ("" "a" "b")
ArrayUtils.addFirst  "myArray"  "c" "d"     # failure
ArrayUtils.addFirst  "myArray"  "foo bar"   # ("foo bar" "" "b" "a")
```

#### Exit codes

* **0**: When first argument is an array and a value must be added.
* **1**: When none or more than 1 value must be added.

#### Output on stdout

* None.

#### Output on stderr

* None.

#### See also

* For adding element in the middle of an array, please check [insert](./insert.md) method.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


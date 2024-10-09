
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.add

Adds a given element at the end of an array.

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

* [ArrayUtils.add](#arrayutilsadd)

### ArrayUtils.add

#### Arguments
| #  | varName        | Type          | in/out   | Default    | Description                          |
|----|----------------|---------------|----------|------------|--------------------------------------|
| $1 | ioArrayName    | ref(string[]) | in & out |            | Name of the array to modify.         |
| $2 | inValue        | string        | in       |            | Value to add at the end of the array.|

#### Example
```bash
ArrayUtils.add  "myArray"              # failure
ArrayUtils.add  "myArray"  "a"         # ("a")
ArrayUtils.add  "myArray"  "b"         # ("a" "b")
ArrayUtils.add  "myArray"  ""          # ("a" "b" "")
ArrayUtils.add  "myArray"  "foo bar"   # ("a" "b" "" "foo bar")
ArrayUtils.add  "myArray"  "c" "d"     # failure
```

#### Exit codes

* **0**: When first argument is an array and the value is not an embedded array or map.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.

#### See also

* For adding element in the middle of an array, please check [insert](./insert.md) method.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.getNumberOfElements

Returns the number of elements in the arrays.

## Overview

This number correspond to the lenght in zsh and could be different in bash
due to the discontinued indexes.

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->


Method description #########################################################

## Index

* [ArrayUtils.getNumberOfElements](#arrayutilsgetnumberofelements)

### ArrayUtils.getNumberOfElements

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                          |
|--------|----------------|---------------|----------|------------|--------------------------------------|
| $1     | inArrayName    | ref(string[]) | in       |            | Name of the array to get length.     |

#### Example
```bash
myArray=("a" "b" "" "c")
ArrayUtils.getNumberOfElements  "myArray"      # 4

myArray[10]=z
ArrayUtils.getNumberOfElements  "myArray"      # bash: 5, zsh: 10

myArray=()
ArrayUtils.getNumberOfElements  "myArray"      # 0
```

#### Exit codes

* **0**: When input array reference exists.
* **1**: Otherwise.

#### Output on stdout

* The number of element, or empty if it's not an array or does not exists.

#### Output on stderr

* None.

#### See also

* [ArrayUtils.getLastIndex](./getLastIndex.md)


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


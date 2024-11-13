
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# Array.sort

Sorts the specified array into alphanumerical order with the bubble sort style.

## Overview

This is for bash 4.3 and under which does not have the option -d of readarray.

### Since:
0.2.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [util](../../util.md) / [Array](../Array.md) / 
<!-- apash.parentEnd -->

## Index

* [Array.bubbleSort](#arraybubblesort)

### Array.bubbleSort

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | inArrayName    | ref(string[]) | in & out |            | The array to sort.                    |

#### Example
```bash
myArray=("a" "b" "c")
Array.sort "myArray"  # ("a" "b" "c")

myArray=("a" "c" "b")
Array.sort "myArray"  # ("a" "b" "c")

myArray=("beta-20" "beta-10" "beta-1")
Array.sort "myArray"  # ("beta-1" "beta-10" "beta-20")

myArray=("1" "a" "2" "3")
Array.sort "myArray"  # ("1" "2" "3" "a")

myArray=("1" "")
Array.sort "myArray"  # ("" "1")
```

#### Exit codes

* **0**: True Whether the array is sorted according to natural ordering.
* **1**: Otherwise.

#### Output on stdout

* None.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


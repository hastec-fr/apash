
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# Random.nextInt

Returns a pseudorandomly chosen int value.

## Overview

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [util](../../util.md) / [Random](../Random.md) / 
<!-- apash.parentEnd -->

## Index

* [Random.nextInt](#randomnextint)

### Random.nextInt

#### Arguments
| #      | varName        | Type          | in/out   | Default    | Description                           |
|--------|----------------|---------------|----------|------------|---------------------------------------|
| $1     | minValue       | number        | in       |            | The least value that can be returned. |
| $2     | maxValue       | number        | in       |            | The upper bound (exclusive) for the returned value. |

#### Example
```bash
Random.nextInt
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

* **0**: When the number is displayed.
* **1**: If the minValue is greater than the maxValue, or numbers are not Integers.

#### Output on stdout

* An pseudorandomly chosen int value between the minValue (inclusive) and the maxValue (exclusive).

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


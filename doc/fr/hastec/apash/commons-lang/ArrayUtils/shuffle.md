
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.shuffle

Randomly permutes the elements of the specified array randomness.

## Overview

### Since:
0.1.0

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.shuffle](#arrayutilsshuffle)

### ArrayUtils.shuffle

#### Arguments
| #      | varName        | Type          | in/out   | Default         | Description                          |
|--------|----------------|---------------|----------|-----------------|--------------------------------------|
| $1     | ioArrayName    | ref(string[]) | in & out |                 |  Name of the array to shuffle.       |

#### Example
```bash
myArray=("a" "b" "c" "d")
ArrayUtils.shuffle    "myArray"                 # ("b" "a"  "d" "c")
ArrayUtils.shuffle    "myArray"                 # ("a" "b" "d" "c")
```

#### Arguments

* **$1** (ref(string[])): Name of the array to shuffle. [Default: N/A]

#### Exit codes

* **0**: When the array is shuffled.
* **1**: When the input is not an array.

#### Output on stdout

* None.

#### Output on stderr

* None.

#### See also

* [https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/ArrayUtils.html#line.8286](https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/ArrayUtils.html#line.8286)


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


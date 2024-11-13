
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# ArrayUtils.join

Return all elements of an array joined by an input string.

## Overview

### Authors:
* Benjamin VARGIN

### Parents
<!-- apash.parentBegin -->
[](../../../../.md) / [apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.parentEnd -->

## Index

* [ArrayUtils.join](#arrayutilsjoin)

### ArrayUtils.join

#### Example
```bash
ArrayUtils.join  ""       ""            # failure - ""
ArrayUtils.join  "myVar"  "a"           # failure - ""

declare -A myMap
ArrayUtils.join  "myMap"  "a"           # failure - ""

myArray=("a" "b" "" "c")
ArrayUtils.join  "myArray"              # "a b  c"
ArrayUtils.join  "myArray"  ","         # "a,b,,c"
ArrayUtils.join  "myArray"  "|1|"       # "a|1|b|1||1|c"

myArray[6]="z"
ArrayUtils.join  "myArray"  ","         # "a,b,,c,,z"
```

#### Arguments

* **$1** (ref(string[])): Name of the array to get values.
* **$2** (string): The delimiter which join values. (Default=" ")

#### Exit codes

* **0**: When first argument is an array.
* **1**: Otherwise.

#### Output on stdout

* A single string having all values of the array joined by the chosen delimiter.

#### Output on stderr

* None.


  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>



<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.isSorted
This method checks whether the provided array is sorted according to natural ordering.

## History
### Since
  * 0.1.0 (hastec-fr)

### Authors:
 * Benjamin VARGIN

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.packageEnd -->

#### Arguments
 | #      | varName        | Type          | in/out   | Default    | Description                          |
 |--------|----------------|---------------|----------|------------|--------------------------------------|
 | $1     | inArrayName    | ref(string[]) | in       |            | Name of the array to check.          |

#### Example
 ```bash
    myArray=()
    ArrayUtils.isSorted "myArray"  # true

    myArray=("a" "b" "c")
    ArrayUtils.isSorted "myArray"  # true

    myArray=("a" "c" "b")
    ArrayUtils.isSorted "myArray"  # false

    myArray=("beta-1" "beta-10" "beta-20")
    ArrayUtils.isSorted "myArray"  # true

    myArray=("1" "a")
    ArrayUtils.isSorted "myArray"  # true
   
    myArray=("" "1")
    ArrayUtils.isSorted "myArray"  # true
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: True Whether the array is sorted according to natural ordering.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


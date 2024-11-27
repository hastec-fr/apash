
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# ArrayUtils.join
Return all elements of an array joined by an input string.

## History
### Since
  * 0.2.0 (hastec-fr)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-lang](../../commons-lang.md) / [ArrayUtils](../ArrayUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName              | Type          | in/out   | Default    | Description                          |
 |--------|----------------------|---------------|----------|------------|--------------------------------------|
 | $1     | apash_inArrayName    | ref(string[]) | in       |            | Name of the array to join.           |
 | $2     | apash_inDelimiter    | string        | in       | " "        | Delimiter joining array elements.    |

### Example
 ```bash
    myArray=("a" "b" "" "c")
    ArrayUtils.join  "myArray"              # "a b  c"
    ArrayUtils.join  "myArray"  ","         # "a,b,,c"
    ArrayUtils.join  "myArray"  "|1|"       # "a|1|b|1||1|c"
    
    myArray[6]="z"
    ArrayUtils.join  "myArray"  ","         # "a,b,,c,,z"
 ```
### Stdout
  * A single string having all values of the array joined by the chosen delimiter.
### Stderr
  * None.

### Exit codes
  * **0**: When first argument is an array.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


# StringUtils.substring

Gets a substring from the specified String.

## Index

* [StringUtils.substring](#stringutilssubstring)

### StringUtils.substring

#### Example

```bash
StringUtils.trim ""                 # return ""
StringUtils.trim "     "            # return ""
StringUtils.trim "  Hello  World  " # return "Hello  World"
```

#### Arguments

* **$1** (the): String to get the substring from
* **$2** (the): position to start from, negative means count back from the end of the String by this many characters
* **$3** (the): position to end at (exclusive), negative means count back from the end of the String by this many characters

#### Exit codes

* **0**: If the string can be displayed.
* **1**: Otherwise.

#### Output on stdout

* substring from start position to end position, empty if empty String input

#### Output on stderr

* None


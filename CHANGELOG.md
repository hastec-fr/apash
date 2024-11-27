# Changelog

All notable changes to this project will be documented in this file.


## [v0.2.0] - 

### Added

- CLI actions:
  - apash check : Check if some commands could be missing
  - apash docker: Allow to create a container specifying a shell and its version.
  - apash minify: Create a minified version of the apash library.
  - apash cache: Create a cache of the import related to a method.
  - apash test --compatibility: Generate a matrix of compatibility.
- Shellspec as framework of tests.
- Template of compatibility matrix and comments.
- Methods:
  - Added Zsh compatibility
  - Added FileNameUtils.getExtension
  - Added ApashUtils.doc
  - Added ArrayUtils.clone (Zsh version)
  - Added ArrayUtils.concat
  - Added ArrayUtils.countMatches
  - Added ArrayUtils.init
  - Added ArrayUtils.initWithValue
  - Added ArrayUtils.initWithValue
  - Added ArrayUtils.isArrayIndex
  - Added ArrayUtils.getLastIndex
  - Added ArrayUtils.getNumberOfElements
  - Added ArrayUtils.init
  - Added ArrayUtils.initWithValue
  - Added ArrayUtils.isSameLastIndex
  - Added ArrayUtils.join
  - Added ArrayUtils.removeAllOccurrences
  - Added ShellUtils.declareArray
  - Added ShellUtils.getFunctionName
  - Added ShellUtils.getParentFunctionName
  - Added ShellUtils.isDeclared
  - Added ShellUtils.isVariable
  - Added ShellUtils.isVariableNameValid
  - Added ShellUtils.isZsh
  - Added CSVUtils.merge (for compatibility matrix purpose only)
  - Added DateUtils.addDays
  - Added DateUtils.addSeconds
  - Added DateUtils.addWeeks
  - Added DateUtils.addYears
  - Added MapUtils.clone
  - Added MapUtils.containsKey
  - Added MapUtils.getKey
  - Added MapUtils.init
  - Added MatrixUtils.create
  - Added MatrixUtils.get
  - Added MatrixUtils.getDim
  - Added MatrixUtils.getDimLastIndex
  - Added MatrixUtils.getDimOffset
  - Added MatrixUtils.getIndex
  - Added MatrixUtils.isMatrix
  - Added MatrixUtils.set
  - Added MatrixUtils.setDim
  - Added MatrixUtils.toString
  - Added NumberUtils.isLong
  - Added NumberUtils.isLongPositive
  - Added StringUtils.contains
  - Added StringUtils.lowercase (zsh/posix version)
  - Added StringUtils.repeat
  - Added StringUtils.splitAny
  - Added VersionUtils.compare
  - Added VersionUtils.isLowerOrEquals
  - Added VersionUtils.isLowerOrEquals
  - Added lang.Long
  - Added Array.sort
  - Added Log.debug
  - Added Log.error
  - Added Log.ex
  - Added Log.fatal
  - Added Log.in
  - Added Log.info
  - Added Log.message
  - Added Log.out
  - Added Log.trace
  - Added Log.warn


### Changed

- The comment format becomes specific to apash.
- getLength: Returns the last index +1 instead of ${#array[@]}. Take case of discontinued indexes into account.
- Array methods are no more erasing the existing value if it's a variable or a map (fail instead to prevent override). The method anythingToEmpty should be used instead for this use case.
- Fixed issue on date test under git bash.
- ⚠️ Breaking change: ShellUtils becomes ShellUtils
- ⚠️ Breaking change: Remove the shell level in directory path /src/...
- Wrap the main script by a more POSIX script which redirect to the correct interpreter.

### Removed

- Remove bats-core dependency (replaced by shellspec).
- Remove shdoc dependency (replaced by a specific apash comment format).


## [v0.1.0] - 2024-10-03

### Added

First release of Apash containing the following methods for bash.
- Added ArrayUtils.add
- Added ArrayUtils.addAll
- Added ArrayUtils.addFirst
- Added ArrayUtils.clone
- Added ArrayUtils.contains
- Added ArrayUtils.getLength
- Added ArrayUtils.indexesOf
- Added ArrayUtils.indexOf
- Added ArrayUtils.insert
- Added ArrayUtils.isArray
- Added ArrayUtils.isArrayIndexValid
- Added ArrayUtils.isEmpty
- Added ArrayUtils.isNotEmpty
- Added ArrayUtils.isSameLength
- Added ArrayUtils.isSorted
- Added ArrayUtils.lastIndexOf
- Added ArrayUtils.nullToEmpty
- Added ArrayUtils.remove
- Added ArrayUtils.removeAll
- Added ArrayUtils.removeAllOccurrences
- Added ArrayUtils.removeDuplicates
- Added ArrayUtils.removeElement
- Added ArrayUtils.removeElements
- Added ArrayUtils.reverse
- Added ArrayUtils.shift
- Added ArrayUtils.shuffle
- Added ArrayUtils.subarray
- Added ArrayUtils.swap
- Added ArrayUtils.toArray
- Added ShellUtils.isCommandValid
- Added ShellUtils.isVariableNameValid
- Added ShellUtils.toArray
- Added DateUtils.add
- Added DateUtils.addDays
- Added DateUtils.addHours
- Added DateUtils.addMonths
- Added DateUtils.isDate
- Added MapUtils.isMap
- Added NumberUtils.compare
- Added NumberUtils.isDigits
- Added NumberUtils.isInteger
- Added NumberUtils.isParsable
- Added NumberUtils.max
- Added NumberUtils.min
- Added StringUtils.abbreviate
- Added StringUtils.containsOnly
- Added StringUtils.countMatches
- Added StringUtils.endsWith
- Added StringUtils.equals
- Added StringUtils.indexOf
- Added StringUtils.indexOfAny
- Added StringUtils.isAnyEmpty
- Added StringUtils.isBlank
- Added StringUtils.isEmpty
- Added StringUtils.leftPad
- Added StringUtils.lowerCase
- Added StringUtils.remove
- Added StringUtils.replace
- Added StringUtils.reverse
- Added StringUtils.rightPad
- Added StringUtils.rotate
- Added StringUtils.split
- Added StringUtils.splitPreserveAllTokens
- Added StringUtils.startsWith
- Added StringUtils.substring
- Added StringUtils.upperCase
- Added Math.abs
- Added Math.max
- Added Math.min
- Added Array.sort
- Added Random.nextInt

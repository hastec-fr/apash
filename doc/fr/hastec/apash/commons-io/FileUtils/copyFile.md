
<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>


# FileNameUtils.copyFile
Copies the contents of a file to a new location.
## Description
   This method copies the contents of the specified source file to the specified destination file.
   The directory holding the destination file is created if it does not exist.
   If the destination file exists, you can overwrite it with REPLACE_EXISTING.

   CopyOptions.ATOMIC_MOVE is not supported
## History
### Since
  * 0.3.0 (Guilhem Baechler)

## Interface
### Package
<!-- apash.packageBegin -->
[apash](../../../apash.md) / [commons-io](../../commons-io.md) / [FileUtils](../FileUtils.md) / 
<!-- apash.packageEnd -->

### Arguments
 | #      | varName        | Type          | in/out   | Default | Description                        |
 |--------|----------------|---------------|----------|---------|------------------------------------|
 | $1     | inSrc          | string        | in       |         | The file name to copy.             |
 | $2     | inDst          | string        | in       |         | The destination file name.         |
 | $3     | inPreserveDate | boolean       | in       | false   | Tells if the date should be copied |
 | $4     | inCopyOption   | string        | in       |         | The copy options separated by a ','|

### Example
 ```bash
   FileUtils.copyFile src.txt dst.txt true "REPLACE_EXISTING,COPY_ATTRIBUTES" # src contents is copied in dst and have the same dates and attributes 
   FileUtils.copyFile src.txt dst.txt                                         # src contents is copied in dst 
   FileUtils.copyFile src.txt dst.txt false "REPLACE_EXISTING"                # src contents is copied in dst but dst doesn't have the same date and replace dst.txt if it already exists 
 ```

### Stdout
  * None.
### Stderr
  * None.

### Exit codes
  * **0**: when the inSrc has been copied in inDst.
  * **1**: Otherwise.

  <div align='right'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>


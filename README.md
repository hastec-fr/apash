
<div align="center"  id="apash-top">
  <img src="assets/apash-logo.svg" ="center" />

  # Apash
  Apache's Programs As SHell
</div>

## 👀 Introduction
Bash and more generally shells are popular command-line and scripting languages that are widely used on Unix-like operating systems, including Linux and macOS. Nervetheless, it always happen to reinvent basic operations like split, trim... by ourself. 
Again we re-invent again these features 😅 by trying to looks like Apache's libraries realized in JAVA to simplify their usage especially for people doing DevOps.

## Table of contents
- [Licence](#licence)

## [📦](#installation) Installation
As other shell projects, there are unfortunately no standard way to install Apash. But here the main's one:
### [Basher](https://www.basher.it/) 
It's a package manager for bash which helps you quickly to install, uninstall and update bash packages (available on github) from the command line.
```bash
# Install Basher 
curl -s "https://raw.githubusercontent.com/basherpm/basher/master/install.sh" | bash

# Install Apash
basher install "hastec-fr/apash"

# Source the main apash script (or add it to your profile and relogin)
source "$HOME/.basher/cellar/packages/hastec-fr/apashSource.sh"
```

### Raw
Clone or download the Apash project, then source the main library (or add it to your profile and relogin).
```bash
source "hastec-fr/apash/apashSource.sh"
```
<div align="right">[ <a href="#apash-logo">↑ Back to top ↑</a> ]</div>

## ⚡️ Quick start
Once Apash is installed, you can easily use the function by importing the package you desire by using command "import" with the name of the package.
```bash
# Java style to import all methods from StringUtils
import fr.hastec.apash.commons-lang.StringUtils
StringUtils.substring "Hello World" 0 4
```
Do you see the 🔥Hell🔥 ? It's just the beginning.<br/>
If it's not the case, lets have a look to the troubleshooting section.

```bash
# Import only a single method
import fr.hastec.apash.commons-lang.StringUtils.indexOf
StringUtils.indexOf "Gooood Morning" "M"
# result: 7 (yes because it start from index 0 ^^)
```

If you don't like this way of import, you can still use the bash source. But note that an import is done inside.
```bash
source fr/hastec/apash/commons-lang/StringUtils.sh
```
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>

## ✨ Features

<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>

## 📖 Documentation
Apash is auto documented using the project [shdoc](https://github.com/reconquest/shdoc). Each file contains an header following the formalism of shdoc in order to generate the corresponding markdown file (.md) in the doc directory.<br>
Let's [explore it](doc/bash/fr/hastec/apash.md) !!
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>

## ❓ Troubleshooting
### I have modified a library but it's not taken into account
The concept with import function is that "." from package replace "/" and it allows to source all sources from a package. In addition, it prevents cycling re-loading of librairies by keeping in mind which source has been loaded inside the hashmap $APASH_LIBRARIES. To see which library is loaded, use:
```bash
  for l in ${!APASH_LIBRARIES[@]}; do echo $l ;done  
```
Three ways to reload a libraries:
```bash
  # Reload libraries (ReSource)
  apachSource -reload

  # ${!APASH_LIBRARIES[<PathToLib>]}=false
  APASH_LIBRARIES["$HOME/.basher/cellar/packages/hastec-fr/fr/hastec/apash/commons-lang/StringUtils/trim.sh"]=false

  # Or simply unset completly the hashmap (but you'll need to re-import libraries)
  declare -A APASH_LIBRARIES
```
 

Meanwhile the project [Amber](https://github.com/amber-lang/amber) becomes operation,
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>

## 📃 [Licence]{#licence}
Apash is free and open-source software licensed under the 
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>
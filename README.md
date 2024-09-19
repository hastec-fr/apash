
<div align="center"  id="apash-top">
  <img src="assets/apash-logo.svg" />

  # Apash
  Apache's Programs As SHell<br>
  [![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
</div>

## 👀 Introduction
Bash and more generally shells are popular command-line and scripting languages that are widely used on Unix-like operating systems, including Linux and macOS. Nervetheless, it always happen to rewrite basic operations like split, trim... by ourself.
Apash is a set of these operations by simplifying their interface. It's **inspired** from [Apache's libraries](https://commons.apache.org/) realized in JAVA.
Note that even if I wish, Apash is not acutally a [project of the Apache Foundation](https://apache.org/index.html#projects-list).
Let's stop talking and open the shell !
```bash
StringUtils.rightPad "Enjoy" 7 "!"
# Enjoy!!
```

## Table of contents
- [Installation](#installation)
- [Quick Start](#️quick-start)
- [Features](#features)
- [Documentation](#documentation)
- [Troubleshooting](#troubleshooting)
- [license](#license)
- [Explore API](doc/bash/fr/hastec/apash.md) (or with the [Full Summary Table](doc/bash/fr/hastec/apacheFullSummaryTable.md))

## <a id="quick-start" ></a>📦 Installation
As other shell projects, unfortunately there is no standard way to install Apash. But here are the main ones:

### <ins>Basher</ins>
[Basher](https://www.basher.it/) is a package manager for bash which helps you to quickly install, uninstall and update bash packages from the command line.
#### Install Basher 
```bash
curl -s "https://raw.githubusercontent.com/basherpm/basher/master/install.sh" | bash
```

#### Install Apash:
```bash
basher install "hastec-fr/apash"
```

#### Execute post installation action:
```bash
"$HOME/.basher/cellar/bin/apash" init --post-install
```

#### Open a new terminal to use apash:
```bash
apash --version
# 0.1.0
```

### <ins>By Script</ins>
Modify the URL in consequence if you want a particular version, here it's for the head of the main branch:
```bash
curl -s "https://raw.githubusercontent.com/hastec-fr/apash/refs/heads/main/utils/install.sh" | bash
```

### <ins>Raw</ins>
Clone or download the Apash project, execute the post installation action.
to add sourcing to your profile. Then open a new terminal to ensure that environnment is loaded.
```bash
apash init --post-install
```

### <a id="dependencies" ></a> <ins>Dependencies</ins>
Some prerequisite could be required if you want to contribute to the project.
For Testing purpose, you need to install [bats-core](https://github.com/bats-core/bats-core).
```bash
basher install "bats-core/bats-core"
```
For Documentation purpose, you need to install [shdoc](https://github.com/reconquest/shdoc).
```bash
basher install "reconquest/shdoc"
```
<div align="right">[ <a href="#apash-logo">↑ Back to top ↑</a> ]</div>

## <a id="quick-start" ></a>⚡️ Quick start
Once Apash is installed, you can easily use the function by importing the package you desire by using command "import" with the name of the package.
```bash
# Java style to import all methods from StringUtils
apash.import "fr.hastec.apash.commons-lang.StringUtils"
StringUtils.substring "Hello World" 0 4
```
Do you see the 🔥Hell🔥 ? It's just the beginning.<br/>
If it's not the case, lets have a look to the troubleshooting section.

```bash
# Import only a single method
apash.import "fr.hastec.apash.commons-lang.StringUtils.indexOf"
StringUtils.indexOf "Gooood Morning" "M"
# result: 7 (yes because it start from index 0 ^^)
```

If you don't like this way of import, you can still use the bash source. But note that an import is done inside.
```bash
source fr/hastec/apash/commons-lang/StringUtils.sh
```
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>

## <a id="documentation" ></a> 📖 Documentation
Apash is auto documented using the project [shdoc](https://github.com/reconquest/shdoc). Each file contains an header following the formalism of shdoc in order to generate the corresponding markdown file (.md) in the doc directory.<br>
Let's [explore the features](doc/bash/fr/hastec/apash.md) !!

To generate the documentation, you need to install the tool [shdoc](https://github.com/reconquest/shdoc) (ref. [dependencies](#dependencies)). Once installed, generate the documentation from the root project directory with the main apash command.
```bash
  apash doc
```
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>

## <a id="tests" ></a> 🧪 Tests
Apash tests are realized with the tool [bats-core](https://github.com/bats-core/bats-core) (ref. [dependencies](#dependencies)). Once installed, launch the campaign of tests from the root project directory.
```bash
  apash test
```
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>

## <a id="tests" ></a> ✨ Tips
### Naming
If you don't like the long name, you can create your own aliases (as usually).
```bash
  alias import="apash.import"
  alias trim="StringUtils.trim"
```
Just keep in mind, that aliases are usefull for your prompt but (depending of the shell) they cannot be exported naturally. By example for bash, you should source again the alias from subscript or activate the shell option (on your own):
```
  shopt -s expand_aliases
```

## <a id="troubleshooting" ></a> ❓ Troubleshooting
### I have modified a library but it's not taken into account
The "import" function replace "." from packages by "/" and it allows to source all scripts from a directory. In addition, it prevents cycling import of re-loading librairies.

It's possible to fore the reload of a libraries (but not recursively to prevent cycling dependencies).
```bash
  # Reload libraries (Re-Source)
  apash.import -f path.to.the.library
``` 

## <a id="license" ></a> 📃 License
Apash is free and open-source software licensed under the [_Apache License Version 2.0_](https://www.apache.org/licenses/LICENSE-2.0.txt) License. Please see the LICENSE.txt file for details.
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>
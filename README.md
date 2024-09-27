<div align="center"  id="apash-top">
  <img src="assets/apash-logo.svg" />

  # Apash
  Apache's Programs As SHell<br>
  [![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
</div>

## 👀 Introduction
Bash and more generally shells are popular command-line and scripting languages that are widely used on Unix-like operating systems, including Linux and macOS. Nervetheless, it always happen to rewrite basic operations like split, trim... by ourself.
Apash is a set of these operations by simplifying their interface. It's **inspired** from [Apache's libraries](https://commons.apache.org/) realized in JAVA.

## Disclaimer
Note that even if it's a wish, Apash is not a [project of the Apache Foundation](https://apache.org/index.html#projects-list).<br/>
Let's stop talking and open the shell !
```bash
StringUtils.rightPad "123" 6 "!"
# 123!!!
```

## Table of contents
- [Installation](#installation)
- [Quick Start](#️quick-start)
- [Features](#features)
- [Documentation](#documentation)
- [Container](#container)
- [Compatibility](#compatibility)
- [Troubleshooting](#troubleshooting)
- [Maintenance](#maintenance)
- [License](#license)
- [Explore the API](doc/bash/fr/hastec/apash.md) (or with the [Full Summary Table](doc/bash/fr/hastec/apacheFullSummaryTable.md))

## <a id="quick-start" ></a>📦 Installation
As other shell projects, unfortunately there is no standard way to install Apash. But below are the main ones.

### <ins>Pre-requisites</ins>
Install curl and git to facilitate the installation. Adapt the command with your package manager
```bash
sudo apt install curl git
```

### <ins>Intallation by Script</ins>
Modify the URL in consequence if you want a particular version, here it's for the head of the main branch:
```bash
curl -s "https://raw.githubusercontent.com/hastec-fr/apash/refs/heads/main/utils/install.sh" | bash
```
Open a new terminal and check the apash version:
```bash
apash --version
# 0.1.0
```

### <ins>Installation with Basher</ins>
[Basher](https://www.basher.it/) is a package manager for bash which helps you to quickly install, uninstall and update bash packages from the command line (does not look compliant with "Git Bash").
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

### <ins>Raw Installation</ins>
Clone or download the [Apash project](https://github.com/hastec-fr/apash), execute the post installation action to add apash sourcing to your startup script file ($HOME/.bashrc).
```bash
git clone "https://github.com/hastec-fr/apash.git"
cd apash

# Post installation action:
apash init --post-install

# Then open a new terminal to ensure that environnment is re-loaded.
```

### <a id="dependencies" ></a> <ins>Dependencies</ins>
Some prerequisite could be required if you want to contribute to the project.
For Testing purpose, you need to install [bats-core](https://github.com/bats-core/bats-core).
```bash
basher install "bats-core/bats-core"
```
If you're using Git Bash, prefer the [bast-core](https://bats-core.readthedocs.io/en/stable/installation.html#windows-installing-bats-from-source-via-git-bash) installation guide:
Check out a copy of the Bats repository and install it to $HOME. This will place the bats executable in $HOME/bin, which should already be in $PATH.
```bash
git clone https://github.com/bats-core/bats-core.git
cd bats-core
./install.sh $HOME
```

For Documentation purpose, you need to install [shdoc](https://github.com/reconquest/shdoc).
```bash
basher install "reconquest/shdoc"
```
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>

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
You can also override the bats options and choose specific tests as in this 
example:
```bash
# Prototype: apash test [-h] [--bats-options options] [--] [test paths]
apash test --bats-options "-t --print-output-on-failure" $APASH_HOME_DIR/test/bash/lang/Math/*.bats
```
Note that bats options are in a single argument.
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
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>

## <a id="container" ></a> 🐳 Container
### One shot
If you don't want to install apash but test it quickly, you can pull its container on [docker hub](https://hub.docker.com/r/hastec/apash)
```bash
docker run --rm hastec/apash:0.1.0 '
apash.import "fr.hastec.apash.commons-lang.StringUtils"
StringUtils.reverse "Never odd or even!"
'
```
Result:
```
!neve ro ddo reveN
```
<br/><br/>
If you don't like to import yourself the command, then use the image with all script pre-loaded:
```bash
docker run --rm hastec/apash:0.1.0-full 'StringUtils.upperCase "Please, speak louder !!"'
```
Result:
```
PLEASE, SPEAK LOUDER !!
```
<br/><br/>
Finally, if you want to test a script, use the light or full image and mount the script as volume.
Take care to provide an absolute host path (not relative).
```bash
cat <<EOF > ./test.sh
apash.import "fr.hastec.apash.commons-lang.StringUtils.abbreviate"
StringUtils.abbreviate "Thanks to abbreviate this long description which does not lead anywhere except to pretend that this function could have a use case." 15
EOF
docker run --rm -v "$PWD/test.sh:/home/apash/test.sh:ro" hastec/apash:0.1.0 ./test.sh
```
Result:
```
Thanks to ab...
```

### Interactive shell
Use the default command of the container to get an interactive prompt.
```bash
docker run --rm -it hastec/apash:0.1.0
apash:bash-5.2 $ echo $BASH_VERSION
# 5.2.32(1)-release
```

### Non Regression
Modify your apash installation and test non regression using containers.
```bash
# From root apash workspace directory ($APASH_HOME_DIR)
docker build -t docker.io/hastec/apash:0.1.0 -f ./docker/apash-bash.dockerfile .
docker run --rm hastec/apash:0.1.0 'apash test'
```
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>

## <a id="compatibility" ></a> ✅ Compatibility
A more complete list of compatibility will be dressed.
Currently it has been tested for bash version 5.2 and require bc to be installed.

## <a id="container" ></a> 🐳 Container
### One shot
If you don't want to install apash but test it quickly, you can pull its container on [docker hub](https://hub.docker.com/r/hastec/apash)
```bash
docker run --rm hastec/apash:0.1.0 '
apash.import "fr.hastec.apash.commons-lang.StringUtils"
StringUtils.reverse "Never odd or even!"
'
```
Result:
```
!neve ro ddo reveN
```
<br/><br/>
If you don't like to import yourself the command, then use the image with all script pre-loaded:
```bash
docker run --rm hastec/apash:0.1.0-full 'StringUtils.upperCase "Please, speak louder !!"'
```
Result:
```
PLEASE, SPEAK LOUDER !!
```
<br/><br/>
Finally, if you want to test a script, use the light or full image and mount the script as volume.
Take care to provide an absolute host path (not relative).
```bash
cat <<EOF > ./test.sh
apash.import "fr.hastec.apash.commons-lang.StringUtils.abbreviate"
StringUtils.abbreviate "Thanks to abbreviate this long description which does not lead anywhere except to pretend that this function could have a use case." 15
EOF
docker run --rm -v "$PWD/test.sh:/home/apash/test.sh:ro" hastec/apash:0.1.0 ./test.sh
```
Result:
```
Thanks to ab...
```

### Interactive shell
Use the default command of the container to get an interactive prompt.
```bash
docker run --rm -it hastec/apash:0.1.0
apash:bash-5.2 $ echo $BASH_VERSION
# 5.2.32(1)-release
```

### Non Regression
Modify your apash installation and test non regression using containers.
```bash
# From root apash workspace directory ($APASH_HOME_DIR)
docker build -t docker.io/hastec/apash:0.1.0 -f ./docker/apash-bash.dockerfile .
docker run --rm hastec/apash:0.1.0 'apash test'
```

## <a id="compatibility" ></a> ✅ Compatibility
A more complete list of compatibility will be dressed.
Currently it has been tested for bash version 5.2.

## <a id="troubleshooting" ></a> ❓ Troubleshooting
### I have modified a library but it's not taken into account
The "apash.import" function replace "." from packages by "/" and allows to source all scripts from a directory. 
In addition, it prevents cycling import of re-loading librairies.

It's possible to force the unitary reload of a libraries.
```bash
  # Reload libraries (Re-Source)
  apash.import -f path.to.the.library
```
### I launch apash with a container but my script is seen as a directory
Double check that the bind mount has an absolute path (not a relative one which does not work everywhere)
```bash
# Example of issue:
docker run --rm -v "./test.sh:/home/apash/test.sh:ro" hastec/apash:0.1.0 ./test.sh
# bash: line 1: ./test.sh: Is a directory

# docker run --rm -v "/absolute/path/to/test.sh:/home/apash/test.sh:ro" hastec/apash:0.1. ./test.sh
# For pseudo relative path, you can use the $PWD variable
docker run --rm -v "$PWD/test.sh:/home/apash/test.sh:ro" hastec/apash:0.1. ./test.sh
```

### Dates issues
When tests are ran with Git Bash, functions on dates are failing because Git bash does not look to [handle natively Time zones](https://stackoverflow.com/questions/77303732/git-bash-date-command-ignoring-tz-env).

If you're playing with days around the change of daylight saving, you could have some troubles. Please refer to the [GNU core FAQ](https://www.gnu.org/software/coreutils/faq/coreutils-faq.html#The-date-command-is-not-working-right_002e).


### Warnings appears
Some Apash Warnings could appears if you do not have a particular command (like "bc" or "rev").
In this case, another way is implemented but notify that the main way of work is not followed and so it is preferred to install the missing command. You can disabled these warning it by exporting the following variable.
```bash
  export APASH_WARNING_DEGRADED="disabled"
```

<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>

## <a id="maintenance" ></a> 🛠 Maintenance

### Upgrade
The lastest version from github is pulled.
#### <ins>Basher</ins>
```bash
basher upgrade hastec-fr/apash
```
#### <ins>Others</ins>
```bash
"$APASH_HOME_DIR/utils/uninstall.sh"
```

### Uninstall
It removes recursively the directory $APASH_HOME_DIR and lines in startup script (.bashrc).
### <ins>Basher</ins>
```bash
basher uninstall hastec-fr/apash
```
Then remove the lines with #apashInstallTag from your profile.
```bash
# Example:
sed -i '/apashInstallTag/d' "$HOME/.bashrc"
```

### <ins>Others</ins>
```bash
"$APASH_HOME_DIR/utils/uninstall.sh"
```

## <a id="license" ></a> 📃 License
Apash is a free and open-source software licensed under the [_Apache License Version 2.0_](https://www.apache.org/licenses/LICENSE-2.0.txt) License. Please see the LICENSE.txt file for details.
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>
<div align="center"  id="apash-top">
  <img src="assets/apash-logo.svg" />

  # Apash
  Apache's Programs As SHell<br>
  [![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
</div>

## 👀 Introduction
Bash and more generally shells are popular command-line and scripting languages that are widely used on Unix-like operating systems, including Linux and macOS. Nervetheless, it always happen to rewrite basic operations by ourself like split, trim...
Apash is a set of these operations. It's **inspired** from [Apache's libraries](https://commons.apache.org/) realized in Java.

## Disclaimer
Note that even if it could be a wish, Apash is not a [project of the Apache Foundation](https://apache.org/index.html#projects-list).<br/>
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
- [Compatibility](#compatibility) ([Matrix](doc/fr/hastec/apashCompatibilityTable.md))
- [Troubleshooting](#troubleshooting)
- [Maintenance](#maintenance)
- [License](#license)
- [Explore the API](doc/fr/hastec/apash.md) (or with the [Full Summary Table](doc/fr/hastec/apacheFullSummaryTable.md))

## <a id="quick-start" ></a>📦 Installation
As other shell projects, unfortunately there is no standard way to install Apash. But below are the main ones.

### <ins>Pre-requisites</ins>
Install curl and git to facilitate the installation. Adapt the command with your package manager
```bash
sudo apt install curl git
```

### <ins>Runtime installation</ins>
In order to facilitate the usage, a minified version of apash is available.<br/>
Just download, source and use. This minified version exists for bash and zsh.
```bash
# Download
curl "https://raw.githubusercontent.com/hastec-fr/apash/refs/heads/main/bin/apash-bash-min.sh" -o apash-bash-min.sh

# Source
. ./apash-bash-min.sh

# Count the number of a in apash.
StringUtils.countMatches "apash" "a"
# result: 2
```

<details>
<summary>Variant ZSH</summary>
Same if you want to use it for zsh.

```bash
curl "https://raw.githubusercontent.com/hastec-fr/apash/refs/heads/main/bin/apash-zsh-min.sh" -o apash-zsh-min.sh
. ./apash-zsh-min.sh
StringUtils.countMatches "apash" "a"
```
</details>

### <ins>Intallation by Script</ins>
Modify the URL in consequence if you want a particular version, here it's for the head of the main branch:
```bash
curl -s "https://raw.githubusercontent.com/hastec-fr/apash/refs/heads/main/utils/install.sh" | bash
```
Open a new terminal and check the apash version:
```bash
apash --version
# 0.2.0
```
<details>
<summary>Variant ZSH</summary>

```bash
curl -s "https://raw.githubusercontent.com/hastec-fr/apash/refs/heads/main/utils/install.sh" | zsh
apash --version
```
</details>


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
# Then open a new terminal to ensure that environnment is re-loaded.
```
Open a new terminal to ensure that environment is refreshed with apash functions.

### <ins>Git Installation</ins>
Clone or download the [Apash project](https://github.com/hastec-fr/apash), execute the post installation action to add apash sourcing to your startup script file (like $HOME/.bashrc).
```bash
# First select where apash should be installed
APASH_HOME_DIR="$HOME/.apash"

git clone "https://github.com/hastec-fr/apash.git" "$APASH_HOME_DIR"
cd "$APASH_HOME_DIR"

# Post installation action:
./apash init --post-install

# Note: If you have changed the default apash location, then
# the configuration file $APASH_HOME_DIR/.apashrc
# is automatically modified in consequence.

# At the end, open a new terminal to ensure that environnment is re-loaded.
```

### <a id="dependencies" ></a> <ins>Dependencies</ins>
One prerequisites is required if you want to contribute to the project.
For Testing purpose, you need to install [shellspec](https://github.com/shellspec/shellspec).
```bash
basher install "shellspec/shellspec"
```
Or use programmatic installation (please refer to their installation section for any changes)
```bash
curl -fsSL https://git.io/shellspec | sh -s -- --yes
echo "PATH=$PATH:$HOME/.local/bin"  # Add shellspec to the path.
```
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>


## <a id="quick-start" ></a>⚡️ Quick start
Once Apash is installed, you can easily use a function by importing the package you desire.<br/>
For that, use the function "apash.import" with the name of the package.
```bash
# Java style to import all methods from StringUtils
apash.import "fr.hastec.apash.commons-lang.StringUtils"
StringUtils.substring "Hello World" 0 4
```
Do you see the 🔥Hell🔥 ? It's just the beginning.<br/>
If it's not the case, lets have a look to the [troubleshooting](#troubleshooting) section.

```bash
# Import only a single method
apash.import "fr.hastec.apash.commons-lang.StringUtils.indexOf"
StringUtils.indexOf "Gooood Morning" "M"
# result: 7 (yes because it start from index 0 ^^)
```
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>

## <a id="documentation" ></a> 📖 Documentation
Domentation is generated thanks to the script comments. 
Each file contains an header following a formalism in order to generate the corresponding markdown file (.md) in the doc directory.<br/>
A template of the documentation is available in [assets/template/apashCommentTemplate.sh](https://github.com/hastec-fr/apash/blob/main/assets/templates/apashCommentTemplate.sh)
Let's [explore the features](doc/fr/hastec/apash.md) !!

To generate the documentation, execute the command:
```bash
  apash doc
```
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>

## <a id="tests" ></a> 🧪 Tests
Apash tests are realized with the tool [shellspec](https://shellspec.info/) (ref. [dependencies](#dependencies)). Once installed, launch the campaign of tests from the root project directory.
```bash
  apash test
```
You can also override the shellspec options and choose specific tests as in this 
example:
```bash
# Prototype: apash test [-h] [--test-options options] [--] [test paths]
apash test --test-options "--directory $APASH_HOME_DIR --shell bash --format tap" $APASH_HOME_DIR/spec/fr/hastec/apash/lang/Math/*_spec.sh
```
Note that shellspec options are in a single argument (here).
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>

## <a id="tests" ></a> ✨ Tips
### Naming
If you don't like the long name, you can create your own aliases (as usually).
```bash
  alias import="apash.import"
  alias trim="StringUtils.trim"

  import fr.hastec.apash.commons-lang.StringUtils.trim
  trim "    This is the end.    "
```
Just keep in mind, that aliases are usefull for your prompt but (depending of the shell) they cannot be exported. 
By example for bash, you should source again the alias from subscript or activate the shell option (on your own):
```
  shopt -s expand_aliases
```
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>

## <a id="container" ></a> 🐳 Container
### One shot
If you don't want to install apash but test it quickly, you can pull its container on [docker hub](https://hub.docker.com/r/hastec/apash).
For version, then default is bash, but you can adapt it with zsh.
```bash
docker run --rm hastec/apash:0.2.0 '   # run for bash
docker run --rm hastec/apash:0.2.0 '   # run for bash
```

```bash
docker run --rm hastec/apash:0.2.0 '
apash.import "fr.hastec.apash.commons-lang.StringUtils"
StringUtils.reverse "Never odd or even!"
'
```

Result:
```bash
!neve ro ddo reveN
```

<br/><br/>

If you don't like to import yourself the command, then use the image with all function ready to use:
```bash
docker run --rm hastec/apash:0.2.0-ready 'StringUtils.upperCase "Please, speak louder !!"'
```

Result:
```bash
PLEASE, SPEAK LOUDER !!
```

<br/><br/>

Finally, if you want to test a script, use the image and mount the script as volume.
Take care to provide an absolute host path (not relative).
```bash
cat <<EOF > ./test.sh
apash.import "fr.hastec.apash.commons-lang.StringUtils.abbreviate"
StringUtils.abbreviate "Thanks to abbreviate this long description which does not lead anywhere except to pretend that this function could have a use case." 15
EOF
docker run --rm -v "$PWD/test.sh:/home/apash/test.sh:ro" hastec/apash:0.2.0 ./test.sh
```

Result:
```bash
Thanks to ab...
```

### Interactive shell
Use the default command of the container to get an interactive prompt.
```bash
docker run --rm -it hastec/apash:0.2.0-bash
apash:bash-5.2 $ echo $BASH_VERSION
# 5.2.32(1)-release
```

### Non Regression
Modify your apash installation and test non regression using containers.
```bash
# From root apash workspace directory ($APASH_HOME_DIR)
docker build -t docker.io/hastec/apash:0.2.0 -f ./docker/apash-bash.dockerfile .
docker run --rm hastec/apash:0.2.0 'apash test'
```
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>

## <a id="container" ></a> 🐳 Container
### One shot
If you don't want to install apash but test it quickly, you can pull its container on [docker hub](https://hub.docker.com/r/hastec/apash)
```bash
docker run --rm hastec/apash:0.2.0 '
apash.import "fr.hastec.apash.commons-lang.StringUtils"
StringUtils.reverse "Never odd or even!"
'
```

Result:
```bash
!neve ro ddo reveN
```
<br/><br/>
If you don't like to import yourself the command, then use the image with all script pre-loaded:

```bash
docker run --rm hastec/apash:0.2.0-full 'StringUtils.upperCase "Please, speak louder !!"'
```

Result:
```bash
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
docker run --rm -v "$PWD/test.sh:/home/apash/test.sh:ro" hastec/apash:0.2.0 ./test.sh
```

Result:
```bash
Thanks to ab...
```

### Interactive shell
Use the default command of the container to get an interactive prompt.
```bash
docker run --rm -it hastec/apash:0.2.0
apash:bash-5.2 $ echo $BASH_VERSION
# 5.2.32(1)-release
```

### Non Regression
Modify your apash installation and test non regression using containers.
```bash
# From root apash workspace directory ($APASH_HOME_DIR)
docker build -t docker.io/hastec/apash:0.2.0 -f ./docker/apash-bash.dockerfile .
docker run --rm hastec/apash:0.2.0 'apash test'
```

## <a id="compatibility" ></a> ✅ Compatibility
A compatibility [matrix](doc/bash/fr/hastec/apashCompatibilityTable.md) is available.<br>
Currently from bash version 5.2 to 4.4 (2016-09-15) looks compatible.<br>
Issues appears at the version 4.3 (2014-02-26) and grow with older versions.
In most of cases, it is due the nameref which is a key feature appearing this the version 4.3.
It is not planned to workaround it for the moment (but any idea is welcome 😉).

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
docker run --rm -v "./test.sh:/home/apash/test.sh:ro" hastec/apash:0.2.0 ./test.sh
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
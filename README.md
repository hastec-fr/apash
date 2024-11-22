<div align="center"  id="apash-top">
  <img src="assets/apash-logo.svg" />

  # Apash
  Apache's Programs As SHell<br>
  [![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
</div>

## 👀 Introduction
Shell script languages (bash, zsh ...) are widely used on Unix-like operating systems, including GNU/Linux and macOS.<br/>
Nervetheless, it often happens to rewrite basic operations by ourself like split, trim ... Again and again for different shells.<br/>
Apash is a library providing these kind operations (for strings, arrays, dates and more...). It is **inspired** from [Apache's libraries](https://commons.apache.org/) realized in Java.<br/>
The [core concepts](#concepts) of Apash is to provide more readibility and portability for basic operations.

## Disclaimer
Note that even if it could be a wish, Apash **is not** a project of the [Apache Foundation](https://apache.org/index.html#projects-list).<br/>
Let's stop talking and open the shell !
```bash
StringUtils.rightPad "123" 6 "!"
# 123!!!
```

## Table of contents
- [Installation](#installation)
- [Quick Start](#️quick-start)
- [Core Concepts](#concepts)
- [Documentation](#documentation)
- [Container](#container)
- [Compatibility](#compatibility) ([Matrix](doc/fr/hastec/apashCompatibilityTable.md))
- [Troubleshooting](#troubleshooting)
- [Maintenance](#maintenance)
- [License](#license)
- [Explore the API](doc/fr/hastec/apash.md) (or with the [Full Summary Table](doc/fr/hastec/apacheFullSummaryTable.md))

## <a id="quick-start" ></a>📦 Installation
As other shell projects, there is no standard way to install Apash. But below are the main ones.

### <ins>Pre-requisites</ins>
Install curl and git to proceed with the scripted installation.
```bash
# Adapt the command with your own package manager (here apt).
sudo apt install curl git
```

### <ins>Runtime installation</ins>
A minified version of apash is available in order to facilitate the usage and gain in performance.<br/>
Just download, source and use. This minified version exists for bash and zsh.
```bash
# Download
curl "https://raw.githubusercontent.com/hastec-fr/apash/refs/heads/main/bin/apash-bash-min.sh" -o apash-bash-min.sh

# Source
. ./apash-bash-min.sh

# Count the number of a in apash.
StringUtils.upperCase "Hello World"
# result: HELLO WORLD
```

<details>
<summary>ZSH Variant</summary>
Same if you want to use it with zsh.

```bash
curl "https://raw.githubusercontent.com/hastec-fr/apash/refs/heads/main/bin/apash-zsh-min.sh" -o apash-zsh-min.sh
. ./apash-zsh-min.sh
StringUtils.upperCase "Hello World"
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
<summary>ZSH Variant</summary>

```bash
curl -s "https://raw.githubusercontent.com/hastec-fr/apash/refs/heads/main/utils/install.sh" | zsh
apash --version
```
</details>

<details>
<summary>Installation with Basher</summary>

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
# Then open a new terminal to ensure that environnment is re-loaded.
```
Open a new terminal to ensure that environment is refreshed with apash functions.
</details>

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
For Testing purpose, [shellspec](https://github.com/shellspec/shellspec) must be installed.
#### Programmatic installation
Please refer to their [installation section](https://github.com/shellspec/shellspec?tab=readme-ov-file#installation) for any changes
```bash
curl -fsSL https://git.io/shellspec | sh -s -- --yes
echo "PATH=\$PATH:\$HOME/.local/bin" >> "$HOME/.bashrc"  # Add shellspec to the path. $HOME/.zshrc for zsh.
```

<details>
<summary>Basher</summary>

```bash
basher install "shellspec/shellspec"
```
</details>

<details>
<summary>Bpkg</summary>

```bash
bpkg install "shellspec/shellspec"
```
</details>

<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>


## <a id="quick-start" ></a>⚡️ Quick start
Once Apash is installed, you can easily use a function by importing the desired package.<br/>
For that, use the function "apash.import" with the name of the package.
```bash
# Java style to import all methods from StringUtils
apash.import "fr.hastec.apash.commons-lang.StringUtils"
StringUtils.substring "Hello World" 0 4
```
Do you see the 🔥Hell🔥in the sHell ? It's just the beginning.<br/>
If it's not the case, lets have a look to the [troubleshooting](#troubleshooting) section.

```bash
# Import only a single method
apash.import "fr.hastec.apash.commons-lang.StringUtils.indexOf"
StringUtils.indexOf "Gooood Morning" "M"
# result: 7 (yes because it starts from index 0 ^^)
```
Note that functions can be directly used without import with minified version.

<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>


## <a id="concepts" ></a>📦 Core Concepts
### Readability
One of the first objectives of Apash was to provide basic operations readable.<br/>
Indeed, shell laguages use many symbols and shortcuts. It looks great for advanced programmers and not readable for the others.<br/>
Example:
```bash
# I want to count the number of "a" in the word "apash".

# For this operation, I need to know 3 commands, 2 options and how are working pipes.
echo "apash" | grep -o "a" | wc -l

# Here, we have an idea of what is doing the function.
StringUtils.countMatches "apash" "a"

# result: 2
```
A missing feature could render the apash function more accessible: a completion mode (to prevent prototype research).<br/>

### Portability
If the SHELL could be defined as a language, there are many dialects (bash, zsh, ksh...) which are not compatible each others.<br/>
The norm POSIX exists for this goal and if a script follow the norm then you're sure that it would work everywhere.<br/>
It's nice, but written a script with POSIX norm is not easy and ask quickly a high skill and knowledge of the norm (no array, less parameter expansions...).<br/>
So Apash takes the problem by the other end. It allows to develop in a dialect with all features of this and provides a mechanism of variants for incompatible codes.<br/>
Example:
```bash
  # The code below show how to decline the code for rendering a string in UPPERCASE.

  # If zsh, then use the corresponding parameter expansion.
  if [ "$APASH_SHELL" = "zsh" ]; then
    echo "${(U)inString}"

  # Else if it's bash with version greater than 4.2, then use another parameter expansion.
  elif [ "$APASH_SHELL" = "bash" ] && \
       ! VersionUtils.isLowerOrEquals "$APASH_SHELL_VERSION" "4.2"; then
    echo "${inString^^}"

  # Otherwise, use a more posix way to transform the string.
  else
    echo "$inString" | awk '{print toupper($0)}'
  fi
```
This can be done inside a single file but it could be segregated per file.
```bash
  lowerCase.sh       # Default script having the function to lowercase a string (generally latest bash version).
  lowerCase.zsh      # Variant for zsh
  lowerCase.bash_4.2 # Variant for bash equals or less than the version 4.2
```
This mechanism allows extending to other shells (ksh, csh, dash...) and sharing a maximum of compatible code in same time.<br/>
Today, the library is really not POSIX (just bash and zsh), but people knowing other shells can contribute with their own dialect.
Even a POSIX form of the functions could be imagined in future with .posix files (with wrapping mechanism for function names using dots).

The goal of Apash is not to create another language like [Amber](https://docs.amber-lang.com/) (I wish the best for this [project](https://github.com/amber-lang/amber)), but to provide same the functions prototype for different kind of shell.<br/>
Apash and Amber are not competitors but they could be complementary.
A file lowerCase.ab could be imagined (with onfly transpilation or if it becomes another interpreter #!/bin/amber 😉).<br/>

## <a id="documentation" ></a> 📖 Documentation
### Web
Domentation is generated thanks to the script comments.
Each file contains an header following a formalism in order to generate the corresponding markdown file (.md) in the doc directory.<br/>
A template of the documentation is available in [assets/template/apashCommentTemplate.sh](https://github.com/hastec-fr/apash/blob/main/assets/templates/apashCommentTemplate.sh).<br/>
Let's [explore the features](doc/fr/hastec/apash.md) !!

To generate the documentation, execute the command:
```bash
  apash doc
```

The latest version of this documentation is available in the [wiki](https://github.com/hastec-fr/apash/wiki) of the project.

### Terminal
You're in a terminal, apash provide a feature to display a summary of the markdown.
```bash
  apash help "lowercase"
  # @file $APASH_HOME_DIR/src/fr/hastec/apash/commons-lang/StringUtils/lowerCase.sh
  # @name StringUtils.lowerCase
  # @brief Converts a String to lower case.
  # ### Arguments
  # #      | Type          | Description
  #--------|---------------|---------------------------------------
  # $1     | string        | The string to lower case.
  #
```
It is possible to provide:
* The absolute path
* The Class.Method
* Just the method (but take the first matching).

<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>

## <a id="tests" ></a> 🧪 Tests
Apash tests are realized with the tool [shellspec](https://shellspec.info/) (ref. [dependencies](#dependencies)). Once installed, launch the campaign of tests from the root project directory.
```bash
  apash test
```
You can also override the shellspec options and choose specific tests as in this example:
```bash
# Prototype: apash test [-h] [--test-options options] [--] [test paths]
apash test --test-options "--directory $APASH_HOME_DIR --shell bash --format tap" $APASH_HOME_DIR/spec/fr/hastec/apash/lang/Math/*_spec.sh
```
Note that shellspec options are in a single argument.
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>

## <a id="tests" ></a> ✨ Tips
### Naming
If you don't like the long name, you can create your own function aliases (as usually).
```bash
  alias import="apash.import"
  alias trim="StringUtils.trim"

  import fr.hastec.apash.commons-lang.StringUtils.trim
  trim "    This is the end.    "
```
Just keep in mind, that aliases are useful for your prompt but (depending of the shell) they cannot be exported. 
By example for bash, you should declare again the alias from subscript or activate the shell option on your own (remains not recommended for portability):
```bash
  shopt -s expand_aliases
```
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>

## <a id="container" ></a> 🐳 Container
### Interactive shell
If you don't want to install apash but test it quickly, you can pull its containers on [docker hub](https://hub.docker.com/r/hastec/apash).
Default is bash, but you can get zsh too.
```bash
docker run --rm hastec/apash:0.2.0             # run with bash (5.2)
docker run --rm hastec/apash:0.2.0-zsh         # run with zsh  (5.9)
docker run --rm hastec/apash:0.2.0-bash-ready  # run with bash (5.2) and functions are already imported.

# Example:
docker run --rm -it hastec/apash:0.2.0-bash
apash:bash-5.2 $ echo $BASH_VERSION
# 5.2.32(1)-release
```

### One shot command
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

### Ready version
If you don't like to import yourself the command, then use the image with all functions ready to use:
```bash
docker run --rm hastec/apash:0.2.0-ready 'StringUtils.upperCase "Please, speak louder !!"'
```
Result:
```bash
PLEASE, SPEAK LOUDER !!
```

### One shot script
Finally, if you want to test a script, use the image and mount the script as volume.
Take care to provide an absolute host path (not relative).
```bash
cat <<EOF > ./test.sh
apash.import fr.hastec.apash.commons-lang.StringUtils.abbreviate
StringUtils.abbreviate "Thanks to abbreviate this long description which does not lead anywhere except to pretend that this function could have a use case." 15
EOF
docker run --rm -v "$PWD/test.sh:/home/apash/test.sh:ro" hastec/apash:0.2.0 ./test.sh
```
Result:
```bash
Thanks to ab...
```

### Rebuild
Modify your apash installation and test non regression using containers.
```bash
# From root apash workspace directory ($APASH_HOME_DIR)
docker build -t docker.io/hastec/apash:0.2.0 -f ./docker/apash-bash.dockerfile .
docker run --rm hastec/apash:0.2.0 'apash test'
```

### Local container
Apash provide a way to build and run a container for a particular shell (bash/zsh) and its version.<br/>
Ideal for testing:
```bash
# The created and run the image with current context($APASH_HOME_DIR).
# The image is named as following: hastec/apash-local:<version>-<shell>_<version>
apash docker --shell "zsh" --version "5.9"  # hastec/apash-local:0.2.0-zsh_5.9
apash docker -s "bash" -v "5.0"             # hastec/apash-local:0.2.0-bash_5.0
```
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>

## <a id="compatibility" ></a> ✅ Compatibility
A compatibility [matrix](doc/fr/hastec/apashCompatibilityTable.md) is available.<br/>
The compatibility is tests on the functions of the library (directory: *src/fr/hastec/apash*), not on the tools around (doc test...) where it's recommended to use latest shell versions.

### Bash
Currently, the library (not tools) is compatible from bash version 5.2 to 4.3 (2014-02-26)<br/>
Issues appears at the version 4.2 (2011-02-13) and olders.<br/>
This is essentially due the **nameref** statement (local -n) which is a key feature appearing with the version 4.3.<br/>
This feature prevent call of the **evil** (*I mean eval. Sorry it looks to be running gag, so I did it*).<br/>
It is not planned to have a workaround for the moment but if it is desired to use apash under this version <br/>
or some people are motivated 😉 to create a .posix version, the evil could be welcome and available only for these specific versions.<br/>
References:
* Bash release version table from [Wikipedia](https://en.wikipedia.org/wiki/Bash_(Unix_shell)).

### Zsh
Currently, the library (not tools) is compatible from bash version 5.9 to 5.3 (2016-12-13)<br/>
As **nameref**, the (P) modifier has been introduced in 5.3.
References:
* [Zsh changelogs](https://zsh.sourceforge.io/releases.html).
* [Zsh anouncement](https://www.zsh.org/mla/announce/).

## <a id="troubleshooting" ></a> ❓ Troubleshooting
### I have modified a library but it's not taken into account
The "apash.import" manage which function should be sourced with its dependencies.
It prevents cycling sourcing and useless re-sourcing (if already sourced).
It's possible to force the reload of a library and its dependencies with option -f.
```bash
  apash.import -f "path.to.the.library"
```

If one new dependencies is not ressourced, then it means you have added it.
Import use a cache to prevent dependency recalculation. You can disable the cache (but it's slower) as following:
```bash
  apash.import -f -n "path.to.the.library"

  # Rebuild the cache if necessary:
  apash.cache "path.to.the.library"
```

If there are any doubts on what is imported, it's possible to trace it:
```bash
  apash.import -f -n -s "path.to.the.library"
```
Note that options should be in the alphabetic order (-f -n -s).

### I launch apash with a container but my script is seen as a directory
Double check that the bind mount has an absolute path (not a relative one which does not work everywhere).
```bash
# Example of issue:
docker run --rm -v "./test.sh:/home/apash/test.sh:ro" hastec/apash:0.2.0 ./test.sh
# bash: line 1: ./test.sh: Is a directory

# docker run --rm -v "/absolute/path/to/test.sh:/home/apash/test.sh:ro" hastec/apash:0.2.0 ./test.sh
# For pseudo relative path, you can use the $PWD variable
docker run --rm -v "$PWD/test.sh:/home/apash/test.sh:ro" hastec/apash:0.2.0 ./test.sh
```

### Dates issues
If you're playing with days around the daylight saving, you could have some troubles. Please refer to the [GNU core FAQ](https://www.gnu.org/software/coreutils/faq/coreutils-faq.html#The-date-command-is-not-working-right_002e).

### Warnings appears
Some Apash Warnings could appear if you do not have a particular command (like "bc" or "rev").
In this case, another way is implemented but it notifies that the main way of work is not followed.<br/> 
The degraded way could be less efficient (and could be different if you're working with bounds).<br/>
So it is preferred to install the missing commands.<br/>
Nevertheless, you can disabled these warnings by modifying the following variable (keep in mind you disabled it !!).
```bash
  export APASH_LOG_WARNING_DEGRADED="false"
```
The value can be modified in $APASH_HOME_DIR/.apashrc or directly in your environment.
 
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>

## <a id="maintenance" ></a> 🛠 Maintenance

### Upgrade
#### Git
Just pull out the latest version of the main branch.
```bash
git checkout main
git pull
```

<details>
<summary>Basher</summary>
The lastest version from main branch of github is pulled.
```bash
basher upgrade hastec-fr/apash
```
#### <ins>Others</ins>
```bash
"$APASH_HOME_DIR/utils/uninstall.sh"
```
</details>

### Uninstall
It removes recursively the directory $APASH_HOME_DIR and lines in startup script (.bashrc).
#### <ins>By Script:</ins>
```bash
"$APASH_HOME_DIR/utils/uninstall.sh"
```

<details>
<summary>Basher</summary>
```bash
basher uninstall "hastec-fr/apash"
```

Then remove the lines with #apashInstallTag from your profile.
```bash
# Example:
sed -i '/apashInstallTag/d' "$HOME/.bashrc"
```
</details>

## <a id="license" ></a> 📃 License
Apash is a free and open-source software licensed under the [_Apache License Version 2.0_](https://www.apache.org/licenses/LICENSE-2.0.txt) License. Please see the LICENSE.txt file for details.
<div align="right">[ <a href="#apash-top">↑ Back to top ↑</a> ]</div>

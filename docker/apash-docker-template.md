<div align="center"  id="apash-top">
  <img src="https://raw.githubusercontent.com/hastec-fr/apash/refs/heads/main/assets/apash-logo.svg" /> 
</div>

# Quick Reference
- Maintained by:<br/>
[Apash Docker Maintainers](https://github.com/hastec-fr/apash)

# Supported tags and respective Dockerfile links
- <u>[`0.2.0`](https://hub.docker.com/layers/hastec/apash/0.2.0/images/sha256-d69cb0b7e63cb7c9d06009774b809f93e00205fb0736347d68cf40cebe0454d0?context=explore)</u> , 
  <u>[`latest`](https://hub.docker.com/layers/hastec/apash/latest/images/sha256-d69cb0b7e63cb7c9d06009774b809f93e00205fb0736347d68cf40cebe0454d0?context=explore)</u>
  - <u>[`0.2.0-ready`](https://hub.docker.com/layers/hastec/apash/0.2.0-bash/images/sha256-d69cb0b7e63cb7c9d06009774b809f93e00205fb0736347d68cf40cebe0454d0?context=explore)</u> ,
    <u>[`latest-ready`](https://hub.docker.com/layers/hastec/apash/0.2.0-bash/images/sha256-d69cb0b7e63cb7c9d06009774b809f93e00205fb0736347d68cf40cebe0454d0?context=explore)</u>
  -  <u>[`0.2.0-bash`](https://hub.docker.com/layers/hastec/apash/0.2.0-bash/images/sha256-d69cb0b7e63cb7c9d06009774b809f93e00205fb0736347d68cf40cebe0454d0?context=explore)</u> , 
  <u>[`0.2.0-bash-ready`](https://hub.docker.com/layers/hastec/apash/0.2.0-bash/images/sha256-d69cb0b7e63cb7c9d06009774b809f93e00205fb0736347d68cf40cebe0454d0?context=explore)</u>
  -  <u>[`0.2.0-zsh`](https://hub.docker.com/layers/hastec/apash/0.2.0-zsh/images/sha256-ca303b8b150fc20d1664565d415a6c7e3e8b7251a8aa85a357a7933f7524ffb1?context=explore)</u> , 
  <u>[`0.2.0-zsh-ready`](https://hub.docker.com/layers/hastec/apash/0.2.0-zsh-ready/images/sha256-bee3abe687aa95b67990820f473202e2461dad79615192c003bf2f6ef37da89c?context=explore)</u>  


- <u>[`0.1.0`](https://hub.docker.com/layers/hastec/apash/0.1.0/images/sha256-d91483d585cdac9ca9a5f6966dc901fc848045e9c9f2069b2bf508e76de84e66?context=explore)</u> , 
  <u>[`0.1.0-ready`](https://hub.docker.com/layers/hastec/apash/0.1.0-ready/images/sha256-7c00674bf94b74c78c146f43ccb6947984acef7b8c141a5f46c6682dbe760bd7?context=explore)</u>

# What is Apash ?
Apash is an open source library providing a set of functions like in the in [Apache's commons interface](https://commons.apache.org/) and more.<br/>
The main purpose of Apash is to provide more readibility and portability for basic operations.
It provides a mechanism of variants for shell dialects (@see the [core concepts](https://github.com/hastec-fr/apash/?tab=readme-ov-file#-core-concepts)).
[Explore the API](https://github.com/hastec-fr/apash/blob/main/doc/bash/fr/hastec/apacheFullSummaryTable.md).

# Disclaimer
Even if it could be a wish, Apash is not a project of the [Apache Foundation](https://apache.org/index.html#projects-list).

# How to use this image ?
Two kinds of image exist, the light one where each library should be imported and the ready one where all functions of the library are pre-loaded (through the minified script).<br/>
The images can be used in one shot or as an interactive shell.

### One shot
If you don't want to install apash but test it quickly:
```bash
docker run --rm hastec/apash:latest '
apash.import "fr.hastec.apash.commons-lang.StringUtils.reverse"
StringUtils.reverse "Never odd or even!"
'
```
Result:
```
!neve ro ddo reveN
```
<br/>

If you don't like to import yourself the command, then use the image with all script pre-loaded:
```bash
docker run --rm hastec/apash:latest-ready 'StringUtils.upperCase "Please, speak louder !!"'
```
Result:
```
PLEASE, SPEAK LOUDER !!
```
<br/>

Finally, if you want to test a script, use the light or full image and mount the script as volume.<br/>
Take care to provide an absolute host path (not relative).
```bash
cat <<EOF > ./test.sh
apash.import "fr.hastec.apash.commons-lang.StringUtils.abbreviate"
StringUtils.abbreviate "Thanks to abbreviate this long description which does not lead anywhere except to pretend that this function could have a use case." 15
EOF
docker run --rm -v "$PWD/test.sh:/home/apash/test.sh:ro" hastec/apash:latest ./test.sh
```
Result:
```
Thanks to ab...
```

### Interactive shell
Use the default command of the container to get an interactive prompt.
```bash
docker run --rm -it hastec/apash:latest
apash:bash-5.2 $ echo $BASH_VERSION
# 5.2.32(1)-release
```

## <a id="license" ></a> 📃 License
Apash is a free and open-source software licensed under the [_Apache License Version 2.0_](https://www.apache.org/licenses/LICENSE-2.0.txt) License.

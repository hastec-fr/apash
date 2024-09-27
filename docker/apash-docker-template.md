<div align="center"  id="apash-top">
  <img src="https://raw.githubusercontent.com/hastec-fr/apash/refs/heads/main/assets/apash-logo.svg" /> 
</div>

# Quick Reference
- Maintained by:<br/>
[Apash Docker Maintainers](https://github.com/hastec-fr/apash)

# Supported tags and respective Dockerfile links
- [0.1.0](https://hub.docker.com/layers/hastec/apash/0.1.0/images/sha256-94b480d9e8c74d7a1dc6bf602be40f190249440ec4762ef4701f410ac10fbfd6?context=explore)
- [0.1.0-full](https://hub.docker.com/layers/hastec/apash/0.1.0-full/images/sha256-a57e7f34308ff9f8a1215ed0b2f669bb0ebcfadc7f2b901a2df6d5569bb379f7?context=explore)

# What is Apash ?
Apash is an open source set of bash functions reproducing famous [Apache's commons interface](https://commons.apache.org/) realized in JAVA.<br/>
The main purpose of Apash is to facilitate the usage of bash for most of basic manipublations.
[Explore the API](https://github.com/hastec-fr/apash/blob/main/doc/bash/fr/hastec/apacheFullSummaryTable.md).

# Disclaimer
Note that even if it's a wish, Apash is not a [project of the Apache Foundation](https://apache.org/index.html#projects-list).

# How to use this image ?
Two kind of image exists, the light one where each library should be imported and the full one where all libraries are pre-loaded.<br/>
The images can be used in one shot or as an interactive shell.

### One shot
If you don't want to install apash but test it quickly:
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
<br/>

If you don't like to import yourself the command, then use the image with all script pre-loaded:
```bash
docker run --rm hastec/apash:0.1.0-full 'StringUtils.upperCase "Please, speak louder !!"'
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

## <a id="license" ></a> 📃 License
Apash is a free and open-source software licensed under the [_Apache License Version 2.0_](https://www.apache.org/licenses/LICENSE-2.0.txt) License.

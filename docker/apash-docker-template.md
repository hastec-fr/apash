<div align="center"  id="apash-top">
  <img src="https://raw.githubusercontent.com/hastec-fr/apash/refs/heads/main/assets/apash-logo.svg" /> 
</div>

# Quick Reference
- Maintained by:<br/>
[Apash Docker Maintainers](https://github.com/hastec-fr/apash)

# Supported tags and respective Dockerfile links
- [0.1.0-snapshot](https://hub.docker.com/layers/hastec/apash/0.1.0-snapshot/images/sha256-b294c11472576b1b1596103d55dc19e424e4bcc3130385806a00af7143a3c1c3?context=explore)
- [0.1.0-full-snapshot](https://hub.docker.com/layers/hastec/apash/0.1.0-full-snapshot/images/sha256-5581aadebe8de4a4d7de961d136a85d8c46ad6c718cef97ac2e1015ddb2df685?context=explore)

# What is Apash ?
Apash is an open source set of bash functions reproducing famous [Apache's commons interface](https://commons.apache.org/) realized in JAVA.<br/>
The main purpose of Apash is to facilitate the usage of bash for most of basic manipublations.

# Disclaimer
Note that even if it's a wish, Apash is not a [project of the Apache Foundation](https://apache.org/index.html#projects-list).

# How to use this image ?
Two kind of image exists, the light one where each library should be imported and the full one where all libraries are pre-loaded.<br/>
The images can be used in one shot or as an interactive shell.

### One shot
If you don't want to install apash but test it quickly:
```bash
docker run --rm hastec/apash:0.1.0-snapshot '
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
docker run --rm hastec/apash-full:0.1.0-snapshot 'StringUtils.upperCase "Please, speak louder !!"'
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
docker run --rm -v "$PWD/test.sh:/home/apash/test.sh:ro" hastec/apash:0.1.0-snapshot ./test.sh
```
Result:
```
Thanks to ab...
```

### Interactive shell
Use the default command of the container to get an interactive prompt.
```bash
docker run --rm -it hastec/apash:0.1.0-snapshot
apash:bash-5.2 $ echo $BASH_VERSION
# 5.2.32(1)-release
```

## <a id="license" ></a> 📃 License
Apash is a free and open-source software licensed under the [_Apache License Version 2.0_](https://www.apache.org/licenses/LICENSE-2.0.txt) License.

#!/usr/bin/env bash
# shellcheck disable=all
# Apash configurations

# Dynamic configuration
if [ -n "${ZSH_VERSION:-}" ]; then
  export APASH_SHELL="zsh"
  export APASH_SHELL_VERSION="${ZSH_VERSION}"
elif [ -n "${BASH_VERSION:-}" ]; then
  export APASH_SHELL="bash"
  export APASH_SHELL_VERSION="${BASH_VERSION%.*}"
else
  echo "$(date +"%FT%T.%3N%z") [WARNING] .apashrc ($LINENO): APASH_SHELL incorrect: '$APASH_SHELL' (accepted values: bash, zsh)" >&2
fi

export APASH_HOME_DIR="${APASH_HOME_DIR:-"$HOME/.apash"}"                  # $HOME/.apash
export PATH="$PATH:$APASH_HOME_DIR"                                        # $PATH:$HOME/.local/bin:$APASH_HOME_DIR
export APASH_LOG_LEVEL="${APASH_LOG_LEVEL:-"300"}"                         # 300 - APASH_LOG_LEVEL_ERROR.
export APASH_LOG_STACK_TRACE="${APASH_LOG_STACK_TRACE:-"true"}"            # true - Print the stack trace related to the error.
export APASH_LOG_WARNING_DEGRADED="${APASH_LOG_WARNING_DEGRADED:-"true"}"  # true - Warn that's not the preferred technical solution.

# Log black/white list allow to filter which should trace or not.
# Let it empty to disabled it, or add functions separated by : as the PATH: "StringUtils.leftPad:StringUtils.rightPad"
export APASH_LOG_BLACKLIST=""   # If function is in the list, then prevent trace logging of this function.
export APASH_LOG_WHITELIST=""   # If function is present in this list, then allow only trace logging of this function.

export APASH_DOCKER_SUDO="true" # Ask for sudo to use the docker command.

######################################################################################################################
export APASH_SUCCESS=0
export APASH_FAILURE=1
export APASH_ARRAY_FIRST_INDEX=0
export APASH_ARRAY_LAST_INDEX=9223372036854775807
if [ "$APASH_SHELL" = "zsh" ]; then
[[ ! $(setopt) == *ksharrays* ]] && APASH_ARRAY_FIRST_INDEX=1
APASH_ARRAY_LAST_INDEX=999999999999999999
fi
apash.import(){
local lib cacheLib l
local -a libs=()
local location=""
local APASH_SRC_DIR="$APASH_HOME_DIR/src"
local APASH_IMPORT_IGNORE="${APASH_IMPORT_IGNORE:-false}"
local APASH_IMPORT_FORCE="${APASH_IMPORT_FORCE:-false}"
local APASH_IMPORT_NO_CACHE="${APASH_IMPORT_NO_CACHE:-false}"
local APASH_IMPORT_SHOW="${APASH_IMPORT_SHOW:-false}"
local APASH_SUCCESS=0
local APASH_FAILURE=1
[ -z "${APASH_LIB_TO_IMPORT:-}" ] && local APASH_LIB_TO_IMPORT=""
[ "$APASH_IMPORT_IGNORE" = "true" ] && return
apash.import.resolve.version(){
local lib="${1:-}"
local vlib version   
[[ -f "${lib%.*}.$APASH_SHELL" ]] && lib="${lib%.*}.$APASH_SHELL"
if [[ -e "${lib%.*}.${APASH_SHELL}_*" ]]; then
for vlib in "${lib%.*}.${APASH_SHELL}_"*; do
[ ! -r "$vlib" ] && continue
version="${vlib#*_}"
if [[ "$(echo -e "$APASH_SHELL_VERSION\n$version" |sort -t. -k 1.2,1n -k 2,2n -k 3,3n | head -n1)" == "$APASH_SHELL_VERSION" ]]; then
lib="$vlib" && break
fi
done
fi
echo "$lib"
}
apash.import.function.exists() {
local lib=$1
typeset -f "$(basename "$(dirname "$lib")").$(basename "${lib%.*}")" > /dev/null 2>&1 && return $APASH_SUCCESS
return $APASH_FAILURE
}
[ "${1:-}" = "-f" ] && APASH_IMPORT_FORCE=true && shift
[ "${1:-}" = "-n" ] && APASH_IMPORT_NO_CACHE=true && shift
[ "${1:-}" = "-s" ] && APASH_IMPORT_SHOW=true && shift
for l in "$@"; do
location="$APASH_SRC_DIR/"${l//./\/}
[ "$APASH_IMPORT_FORCE" = "false" ] && apash.import.function.exists "$location" && continue
if [ -r "$l" ]; then
libs+=("$l")
elif [ -r "$APASH_SRC_DIR/$l" ]; then
libs+=("$APASH_SRC_DIR/$l")
elif [ -d "$location" ]; then
for lib in "$location"/*.sh; do
libs+=("$lib")
done
elif [ -r "${location}.sh" ]; then
libs+=("$location.sh")
elif [ -r "${location/\/sh/}.sh" ]; then
libs+=("${location/\/sh/}.sh")
elif [ -d "$l" ]; then
location="$l"
for lib in "$location"/*.sh; do
libs+=("$lib")
done
elif [ -d "$APASH_SRC_DIR/$l" ]; then
location="$APASH_SRC_DIR/$l"
for lib in "$location"/*.sh; do
libs+=("$lib")
done
else
echo "$(date +"%FT%T.%3N%z") [WARNING] apash.import ($LINENO): Unknown library: '$l' - '$location'" >&2
continue
fi
done
for lib in "${libs[@]}"; do
[ "$APASH_IMPORT_FORCE" = "false" ] && apash.import.function.exists "$lib" && continue
lib=$(apash.import.resolve.version "$lib")
[ ! -r "$lib" ] && echo "WARNING: non readable library: $lib" >&2 && continue
[[ ":$APASH_LIB_TO_IMPORT:" =~ ":$lib:" ]] && continue
cacheLib="${lib/$APASH_HOME_DIR\/src/$APASH_HOME_DIR\/cache}"
cacheLib="${cacheLib%.sh}.cache"
if [ "$APASH_IMPORT_NO_CACHE" = "false" ] && [ -f "$cacheLib" ]; then
while read -r l; do
l=$(apash.import.resolve.version "${l/\$APASH_HOME_DIR/$APASH_HOME_DIR}")
APASH_IMPORT_IGNORE=true source "$l"
[ "$APASH_IMPORT_SHOW" = "true" ] && echo "$l"
done < "$cacheLib"
else
APASH_LIB_TO_IMPORT+=":$lib:"
source "$lib"
[ "$APASH_IMPORT_SHOW" = "true" ] && echo "$lib"
fi
done
return $APASH_SUCCESS
}
if [[ "$APASH_SHELL" == "bash" ]]; then
export -f apash.import
elif [[ "$APASH_SHELL" == "zsh"  ]] && [[ ! ":${FPATH}:" =~ :${0:A:h}:  ]]; then
FPATH+=":${0:A:h}"
autoload -Uz apash.import
fi
FileNameUtils.getExtension() { 
Log.in $LINENO "$@"
local inFileName="${1:-}"
inFileName="$(basename "$inFileName")"   || { Log.ex $LINENO; return "$APASH_FAILURE"; }
! StringUtils.contains "$inFileName" "." && { Log.out $LINENO; return "$APASH_SUCCESS"; }
echo "${inFileName##*.}" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.ex $LINENO; return "$APASH_SUCCESS";
}
ApashUtils.doc() {
Log.in $LINENO "$@"
local inFile="${1:-}"
local comments=""
[ ! -r "$inFile" ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
comments="$(sed -n -e '/^\s*##\//,/^\s*#\//p' "$inFile" | sed -n -e 's/^\s*##\?\/\?//p')"
comments="$(echo -E "$comments" | awk '
BEGIN { blockCodeFlag = 0 }
/^\s*```/             { blockCodeFlag=!blockCodeFlag }
!/^\s*@exitcode\s+/   { exitCodeFlag=0 }
! blockCodeFlag && /^\s*#/ { gsub(/^\s+/, ""); }
/^\s*@name\s+/            { $1=""; gsub(/^\s+/, ""); print "#",$0; next }
/^\s*@brief\s+/           { $1=""; gsub(/^\s+/, ""); print $0; next }
/^\s*@description(\s+|$)/ { $1=""; gsub(/^\s+/, ""); print "## Description"; next }
/^\s*@since(\s+|$)/  ||
/^\s*@see(\s+|$)/    ||
/^\s*@stdout(\s+|$)/ ||
/^\s*@stderr(\s+|$)/ {
if ($1 == "@since") { title="### Since" }
else if ($1 == "@stdout") { title="### Stdout" }
else if ($1 == "@stderr") { title="### Stderr" }
else if ($1 == "@see")    { title="### See also" }
print title; $1=""; gsub(/^\s+/, ""); if ($0 != "") { print "  * "$0; }; next
}
! exitCodeFlag && /^\s*@exitcode\s+/ { exitCodeFlag=1; print "### Exit codes" }
exitCodeFlag && /^\s*@exitcode\s+/ {
$1=""; gsub(/^\s+/, "");
if ($0 != "") {
printf "  * **"$1"**: ";
$1=""; gsub(/^\s+/, "");
print $0;
}
next
}
/^\s*@apashPackage\s*$/      { print "### Package\n<!-- apash.packageBegin -->\n<!-- apash.packageEnd -->"; next}
/^\s*@apashSummaryTable\s*$/ { print "### Method Summary\n<!-- apash.summaryTableBegin -->\n<!-- apash.summaryTableEnd -->"; next}
{ print $0; exitCodeFlag=0  }
')" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
echo -E "$comments" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
commons-lang.ApashUtils() { true; }
ArrayUtils.add() {
Log.in $LINENO "$@"
local apash_ioArrayName="${1:-}"
local apash_inValue="${2:-}"
[ $# -gt 2 ] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
ArrayUtils.nullToEmpty "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
[ $# -lt 2 ] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
if [ "$APASH_SHELL" = "zsh" ]; then
local -a apash_outArray=()
ArrayUtils.clone "$apash_ioArrayName" "apash_outArray" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
apash_outArray+=("$apash_inValue")                     || { Log.ex $LINENO; return "$APASH_FAILURE"; }
ArrayUtils.clone "apash_outArray" "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
else
local -n apash_inArray="$apash_ioArrayName"
apash_inArray+=("$apash_inValue") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
fi
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.addAll() {
Log.in $LINENO "$@"
local apash_ioArrayName="${1:-}"
ArrayUtils.nullToEmpty "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
shift
[ $# -eq 0 ] && return "$APASH_SUCCESS"
if [ "$APASH_SHELL" = "zsh" ]; then
local -a apash_outArray=()
ArrayUtils.clone "$apash_ioArrayName" "apash_outArray" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
else # bash
local -n apash_outArray="$apash_ioArrayName"
fi
apash_outArray+=("$@")                                   || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [ "$APASH_SHELL" = "zsh" ]; then
ArrayUtils.clone "apash_outArray" "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
fi
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.addFirst() {
Log.in $LINENO "$@"
local apash_ioArrayName="${1:-}"
local apash_inValue="${2:-}"
local -a apash_outArray=("$apash_inValue")
local -a apash_inArray=()
local -i apash_i
[ $# -gt 2 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
ArrayUtils.nullToEmpty "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
[ $# -lt 2 ] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
ArrayUtils.clone "$apash_ioArrayName" "apash_inArray" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [ "$APASH_SHELL" = "zsh" ]; then
apash_outArray+=("${apash_inArray[@]}")
else
for apash_i in "${!apash_inArray[@]}"; do
apash_outArray[apash_i+1]="${apash_inArray[apash_i]}"
done
fi
ArrayUtils.clone "apash_outArray" "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.anythingToEmpty() {
Log.in $LINENO "$@"
local apash_ioArrayName="${1:-}"
ShellUtils.isVariableNameValid "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
unset "$apash_ioArrayName"
ShellUtils.declareArray "$apash_ioArrayName"        || { Log.ex $LINENO; return "$APASH_FAILURE"; }
return "$APASH_SUCCESS"
}
ArrayUtils.clone() {
Log.in $LINENO "$@"
local apash_ArrayUtils_clone_inArrayName="${1:-}"
local apash_ArrayUtils_clone_outArrayName="${2:-}"
ArrayUtils.isArray "$apash_ArrayUtils_clone_inArrayName"  || { Log.ex $LINENO; return "$APASH_FAILURE"; }
ArrayUtils.init    "$apash_ArrayUtils_clone_outArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
local -n apash_ArrayUtils_clone_inArrayName="$apash_ArrayUtils_clone_inArrayName"
local -n apash_ArrayUtils_clone_outArray="$apash_ArrayUtils_clone_outArrayName"
local -i apash_i
for apash_i in "${!apash_ArrayUtils_clone_inArrayName[@]}"; do
apash_ArrayUtils_clone_outArray[apash_i]="${apash_ArrayUtils_clone_inArrayName[apash_i]}"
done
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.concat() {
Log.in $LINENO "$@"
local apash_outArrayName="${1:-}"
local apash_arrayName
local -a apash_outArray=()
local -i apash_i apash_counter=0
[ $# -lt 1 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
shift
for apash_arrayName in "$@"; do
ArrayUtils.isArray "$apash_arrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
done
ArrayUtils.nullToEmpty "$apash_outArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
for apash_arrayName in "$@"; do
if [ "$APASH_SHELL" = "zsh" ]; then
[[ ${#${(P)apash_arrayName[@]}} == 1 && ${${(P)apash_arrayName}[@]} == "" ]] \
&& apash_outArray+=("") \
|| apash_outArray+=("${${(P)apash_arrayName}[@]}")
else
local -n apash_inArray="$apash_arrayName"
[[ ${#apash_inArray[@]} -eq 0 ]] && continue
for apash_i in "${!apash_inArray[@]}"; do
apash_outArray[apash_counter+apash_i]="${apash_inArray[apash_i]}"
done
apash_counter=$(ArrayUtils.getLastIndex "apash_outArray") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
((apash_counter++))
fi
done
ArrayUtils.clone "apash_outArray" "$apash_outArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.contains() {
Log.in $LINENO "$@"
local apash_inArrayName="${1:-}"
local apash_inValue="${2:-}"
local apash_value=""
[ $# -ne 2 ]                            && { Log.ex $LINENO; return "$APASH_FAILURE"; }
ArrayUtils.isArray "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [ "$APASH_SHELL" = "zsh" ]; then
local -a apash_inArray=()
ArrayUtils.clone "$apash_inArrayName" apash_inArray || { Log.ex $LINENO; return "$APASH_FAILURE"; }
else
local -n apash_inArray="$apash_inArrayName"
fi 
for apash_value in "${apash_inArray[@]:-}"; do
[[ "$apash_value" == "$apash_inValue" ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
done
Log.out $LINENO; return "$APASH_FAILURE"
}
ArrayUtils.countMatches() {
Log.in $LINENO "$@"
local apash_inArrayName="${1:-}"
local apash_inValue="${2:-}"
local apash_value
local -i apash_counter=0
ArrayUtils.isArray "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [ "$APASH_SHELL" = "zsh" ]; then
for apash_value in "${${(P)apash_inArrayName}[@]}"; do
[[ "$apash_value" == "$apash_inValue" ]] && ((apash_counter++))
done
else
local -n apash_inArray="$apash_inArrayName"
for apash_value in "${apash_inArray[@]}"; do
[[ "$apash_value" == "$apash_inValue" ]] && ((apash_counter++))
done
fi
echo "$apash_counter" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.get() {
Log.in $LINENO "$@"
local apash_inArrayName="${1:-}"
local apash_inIndex="${2:-}"
local apash_inDefaultValue="${3:-}"
ArrayUtils.isArray "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if ! ArrayUtils.isArrayIndexValid "$apash_inArrayName" "$apash_inIndex"; then
[[ $# -ne 3 ]] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
echo "$apash_inDefaultValue" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
fi
if [ "$APASH_SHELL" = "zsh" ]; then
echo "${${(P)apash_inArrayName}[$apash_inIndex]}" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
else
local -n apash_inArray="$apash_inArrayName"
echo "${apash_inArray[$apash_inIndex]}" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
fi
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.getLastIndex() {
Log.in $LINENO "$@"
local apash_inArrayName="${1:-}"
ArrayUtils.isArray "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [ "$APASH_SHELL" = "zsh" ]; then
local apash_arrayLength=${#${(P)apash_inArrayName}[@]}
[[ $apash_arrayLength == 0 ]] && echo "-1" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
echo "$(( APASH_ARRAY_FIRST_INDEX == 0 ? apash_arrayLength -  1 : apash_arrayLength))" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
else # bash
local -n apash_inArray="$apash_inArrayName"
[[ ${#apash_inArray[@]} == 0 ]] && echo "-1" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
local apash_indexes=("${!apash_inArray[@]}")
echo "${apash_indexes[-1]}" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
fi
Log.out $LINENO; return "$APASH_FAILURE"
}
ArrayUtils.getLength() {
Log.in $LINENO "$@"
local apash_inArrayName="${1:-}"
local apash_lastIndex
if [ "$APASH_SHELL" = "zsh" ]; then
ArrayUtils.isArray "$apash_inArrayName" || { Log.ex  $LINENO; return "$APASH_FAILURE"; }
echo "${#${(PA)apash_inArrayName}[@]}"  && { Log.out $LINENO; return "$APASH_SUCCESS"; }
else # bash
apash_lastIndex=$(ArrayUtils.getLastIndex "$apash_inArrayName") || { Log.ex $LINENO; return "$APASH_FAILURE"; }  
[[ $apash_lastIndex == $APASH_ARRAY_LAST_INDEX ]] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
echo "$((apash_lastIndex+1))"                     || { Log.ex $LINENO; return "$APASH_FAILURE"; }
fi
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.getNumberOfElements() {
Log.in $LINENO "$@"
local apash_inArrayName="${1:-}"
ArrayUtils.isArray "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [ "$APASH_SHELL" = "zsh" ]; then
echo "${#${(PA)apash_inArrayName}[@]}" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
else # bash
local -n apash_inArray="$apash_inArrayName"
echo "${#apash_inArray[@]}" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
fi
Log.out $LINENO; return "$APASH_FAILURE"
}
ArrayUtils.indexesOf() {
Log.in $LINENO "$@"
local apash_outIndexesName="${1:-}"
local apash_inArrayName="${2:-}"
local apash_inValue="${3:-}"
local apash_inStart="${4:-0}"
local -i apash_i
local -a apash_outIndexes=()
ArrayUtils.nullToEmpty "$apash_outIndexesName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
ArrayUtils.isArray "$apash_inArrayName"        || { Log.ex $LINENO; return "$APASH_FAILURE"; }
NumberUtils.isLong "$apash_inStart"            || { Log.ex $LINENO; return "$APASH_FAILURE"; }
[[ $apash_inStart -lt $APASH_ARRAY_FIRST_INDEX ]] && apash_inStart=$APASH_ARRAY_FIRST_INDEX
if [ "$APASH_SHELL" = "zsh" ]; then
for (( apash_i=apash_inStart; apash_i < APASH_ARRAY_FIRST_INDEX+${#${(P)apash_inArrayName}[@]} ; apash_i++ )); do
[[ "${${(P)apash_inArrayName}[apash_i]}" == "$apash_inValue" ]] && apash_outIndexes+=("$apash_i")
done
else
local -n apash_inArray="$apash_inArrayName"
for (( apash_i=apash_inStart; apash_i < APASH_ARRAY_FIRST_INDEX+${#apash_inArray[@]} ; apash_i++ )); do
[[ "${apash_inArray[apash_i]}" == "$apash_inValue" ]] && apash_outIndexes+=("$apash_i")
done
fi
ArrayUtils.clone apash_outIndexes "$apash_outIndexesName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.indexOf() {
Log.in $LINENO "$@"
local apash_inArrayName="${1:-}"
local apash_inValue="${2:-}"
local apash_inStart="${3:-$APASH_ARRAY_FIRST_INDEX}"
local -i apash_i
local apash_lastIndex
[[ $# -lt 2 ]] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
NumberUtils.isLong "$apash_inStart" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
apash_lastIndex=$(ArrayUtils.getLastIndex "$apash_inArrayName") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
[[ $apash_inStart -lt $APASH_ARRAY_FIRST_INDEX ]] && apash_inStart=$APASH_ARRAY_FIRST_INDEX
if [ "$APASH_SHELL" = "zsh" ]; then
for (( apash_i=apash_inStart; apash_i < apash_lastIndex+1 ; apash_i++ )); do
[[ "${${(P)apash_inArrayName}[apash_i]}" == "$apash_inValue" ]] && echo "$apash_i" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
done
else
local -n apash_inArray="$apash_inArrayName"
for (( apash_i=apash_inStart; apash_i < apash_lastIndex+1 ; apash_i++ )); do
[[ "${apash_inArray[apash_i]}" == "$apash_inValue" ]] && echo "$apash_i" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
done
fi
echo "$ArrayUtils_INDEX_NOT_FOUND" || { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.init() {
Log.in $LINENO "$@"
local apash_ArrayUtils_init_ioArrayName="${1:-}"
ShellUtils.isVariableNameValid "$apash_ArrayUtils_init_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
ShellUtils.isVariable "$apash_ArrayUtils_init_ioArrayName"          && { Log.ex $LINENO; return "$APASH_FAILURE"; }
MapUtils.isMap "$apash_ArrayUtils_init_ioArrayName"                && { Log.ex $LINENO; return "$APASH_FAILURE"; }
if ! ShellUtils.isDeclared "$apash_ArrayUtils_init_ioArrayName"; then
ShellUtils.declareArray "$apash_ArrayUtils_init_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
fi
if [ "$APASH_SHELL" = "zsh" ]; then
: ${(PA)apash_ArrayUtils_init_ioArrayName::=${ArrayUtils_EMPTY_ARRAY[@]}} && { Log.out $LINENO; return "$APASH_SUCCESS"; }
else
local -n apash_ArrayUtils_init_outArray="$apash_ArrayUtils_init_ioArrayName"
apash_ArrayUtils_init_outArray=() && { Log.out $LINENO; return "$APASH_SUCCESS"; }
fi
Log.out $LINENO; return "$APASH_FAILURE"
}
ArrayUtils.initWithValue() {
Log.in $LINENO "$@"
local ioArrayName="${1:-}"
local inWidth="${2:-0}"
local inValue="${3:-}"
local -i i
local apash_ArrayUtils_initWithValue_outArray=()
NumberUtils.isLong "$inWidth" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
for (( i=0 ; i < inWidth; i++ )); do
apash_ArrayUtils_initWithValue_outArray+=("$inValue")
done
ArrayUtils.clone "apash_ArrayUtils_initWithValue_outArray" "$ioArrayName" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
Log.out $LINENO; return "$APASH_FAILURE"
}
ArrayUtils.insert() {
Log.in $LINENO "$@"
[ $# -lt 3 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
local apash_inIndex="${1:-}"
local apash_ioArrayName="${2:-}"
local -i apash_i
local -i apash_j
shift 2
local apash_inValues=("$@")
ArrayUtils.isArray "$apash_ioArrayName"  || { Log.ex $LINENO; return "$APASH_FAILURE"; }
ArrayUtils.isArrayIndex "$apash_inIndex" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [ "$APASH_SHELL" = "zsh" ]; then
local -a apash_outArray=()
apash_outArray=("${${(P)apash_ioArrayName}[@]:0:$((apash_inIndex-APASH_ARRAY_FIRST_INDEX))}" \
"${apash_inValues[@]}" \
"${${(P)apash_ioArrayName}[@]:$((apash_inIndex-APASH_ARRAY_FIRST_INDEX))}") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
ArrayUtils.clone "apash_outArray" "$apash_ioArrayName" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
else
local -n apash_ioArray="$apash_ioArrayName"
local apash_isInserted=false
for apash_i in "${!apash_ioArray[@]}"; do
if [[ $apash_i -lt apash_inIndex ]]; then
apash_outArray[apash_i]="${apash_ioArray[apash_i]}"
elif [[ $apash_i -ge apash_inIndex ]]; then
if [[ $apash_isInserted == false ]]; then
for (( apash_j=APASH_ARRAY_FIRST_INDEX; apash_j < APASH_ARRAY_FIRST_INDEX+${#apash_inValues[@]}; apash_j++ )); do
apash_outArray[apash_j+apash_inIndex]=${apash_inValues[apash_j]}     || { Log.ex $LINENO; return "$APASH_FAILURE"; }
done
apash_isInserted=true
fi
apash_outArray[apash_i+${#apash_inValues[@]}]="${apash_ioArray[apash_i]}" || { Log.ex $LINENO; return "$APASH_FAILURE"; } 
fi
done
if [[ $apash_isInserted == false ]]; then
for (( apash_i=APASH_ARRAY_FIRST_INDEX; apash_i < APASH_ARRAY_FIRST_INDEX+${#apash_inValues[@]}; apash_i++ )); do
apash_outArray[apash_i+apash_inIndex]="${apash_inValues[apash_i]}" || { Log.ex $LINENO; return "$APASH_FAILURE"; } 
done
fi
ArrayUtils.clone "apash_outArray" "$apash_ioArrayName" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
fi
Log.out $LINENO; return "$APASH_FAILURE"
}
ArrayUtils.isArray() {
Log.in $LINENO "$@"
local inVarName="${1:-}"
declare -p "$inVarName" 2> /dev/null | grep -q "^\(declare\|typeset\).* -a " && { Log.out $LINENO; return "$APASH_SUCCESS"; }
Log.out $LINENO; return "$APASH_FAILURE"
}
ArrayUtils.isArrayIndex() {
Log.in $LINENO "$@"
local inIndex="${1:-}"
NumberUtils.isLong "$inIndex"               || { Log.out $LINENO; return "$APASH_FAILURE"; }
[[ $inIndex -lt $APASH_ARRAY_FIRST_INDEX ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.isArrayIndexValid() {
Log.in $LINENO "$@"
local inArrayName="${1:-}"
local inIndex="${2:-}"
local lastIndex
ArrayUtils.isArray "$inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
NumberUtils.isDigits "$inIndex"   || { Log.ex $LINENO; return "$APASH_FAILURE"; }
lastIndex=$(ArrayUtils.getLastIndex "$inArrayName")  || { Log.ex $LINENO; return "$APASH_FAILURE"; }
NumberUtils.isDigits "$lastIndex" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
[[ $inIndex -lt $APASH_ARRAY_FIRST_INDEX ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
[[ $inIndex -gt $lastIndex ]]               && { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.isEmpty() {
Log.in $LINENO "$@"
local apash_inArrayName="${1:-}"
ArrayUtils.isArray "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [ "$APASH_SHELL" = "zsh" ]; then
[[ ${#${(P)apash_inArrayName}[@]} -ne 0 ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
else
local -n apash_inArray="$apash_inArrayName"
[[ ${#apash_inArray[@]} -ne 0 ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
fi
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.isNotEmpty() {
Log.in $LINENO "$@"
local apash_inArrayName="${1:-}"
ArrayUtils.isArray "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [[ $APASH_SHELL == "zsh" ]]; then
[[ ${#${(P)apash_inArrayName}[@]} -eq 0 ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
else
local -n apash_inArray="$apash_inArrayName"
[[ ${#apash_inArray[@]} -eq 0 ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
fi
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.isSameLastIndex() {
Log.in $LINENO "$@"
local inArrayName1="${1:-}"
local inArrayName2="${2:-}"
local lastIndex1
local lastIndex2
lastIndex1=$(ArrayUtils.getLastIndex "$inArrayName1") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
lastIndex2=$(ArrayUtils.getLastIndex "$inArrayName2") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
[[ $lastIndex1 -ne $lastIndex2 ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.isSameLength() {
Log.in $LINENO "$@"
local apash_inArrayName1="${1:-}"
local apash_inArrayName2="${2:-}"
ArrayUtils.isArray "$apash_inArrayName1" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
ArrayUtils.isArray "$apash_inArrayName2" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [ $APASH_SHELL = "zsh" ]; then
[[ ${#${(P)apash_inArrayName1}[@]} -ne ${#${(P)apash_inArrayName2}[@]} ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
else
local -n apash_inArray1="$apash_inArrayName1"  
local -n apash_inArray2="$apash_inArrayName2"  
[[ ${#apash_inArray1[@]} -ne ${#apash_inArray2[@]} ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
fi
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.isSorted() {
Log.in $LINENO "$@"
local apash_inArrayName="${1:-}"
local -i apash_i
ArrayUtils.isArray "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [ "$APASH_SHELL" = "zsh" ]; then
local apash_inArray=()
ArrayUtils.clone "$apash_inArrayName" apash_inArray || { Log.ex $LINENO; return "$APASH_FAILURE"; }
else
local -n apash_inArray="$apash_inArrayName"
fi
for (( apash_i=APASH_ARRAY_FIRST_INDEX; apash_i < APASH_ARRAY_FIRST_INDEX+${#apash_inArray[@]}-1; apash_i++ )); do
[[ "${apash_inArray[apash_i]}" > "${apash_inArray[apash_i+1]}" ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
done
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.join() {
Log.in $LINENO "$@"
local apash_inArrayName="${1:-}"
local apash_inDelimiter="${2:- }"
local apash_outString=""
local apash_arrayLength
local -i apash_i
apash_arrayLength=$(ArrayUtils.getLength "$apash_inArrayName") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [ "$APASH_SHELL" = "zsh" ]; then
apash_outString="${${(P)apash_inArrayName}[APASH_ARRAY_FIRST_INDEX]:-}"
for (( apash_i=APASH_ARRAY_FIRST_INDEX+1; apash_i < APASH_ARRAY_FIRST_INDEX+apash_arrayLength; apash_i++ )); do
apash_outString+="${apash_inDelimiter}${${(P)apash_inArrayName}[apash_i]:-}"
done
else # bash
local -n apash_inArray="$apash_inArrayName"
apash_outString="${apash_inArray[0]:-}"
for (( apash_i=APASH_ARRAY_FIRST_INDEX+1; apash_i < APASH_ARRAY_FIRST_INDEX+apash_arrayLength; apash_i++ )); do
apash_outString+="${apash_inDelimiter}${apash_inArray[apash_i]:-}"
done
fi
echo "$apash_outString" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.lastIndexOf() {
Log.in $LINENO "$@"
[[ $# -lt 2 ]] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
local apash_inArrayName="${1:-}"
local apash_inValue="${2:-}"
local apash_inStart="${3:-0}"
local apash_i
ArrayUtils.isArray "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
NumberUtils.isLong "$apash_inStart"     || { Log.ex $LINENO; return "$APASH_FAILURE"; }
[[ $apash_inStart -lt $APASH_ARRAY_FIRST_INDEX ]] && apash_inStart=$APASH_ARRAY_FIRST_INDEX
if [ "$APASH_SHELL" =  "zsh" ]; then
local -a apash_inArray=()
ArrayUtils.clone "$apash_inArrayName" "apash_inArray" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
else
local -n apash_inArray="$apash_inArrayName"
fi
for (( apash_i=APASH_ARRAY_FIRST_INDEX+${#apash_inArray[@]}-1; apash_i >= apash_inStart; apash_i-- )); do
[[ "${apash_inArray[apash_i]}" == "$apash_inValue" ]] && echo "$apash_i" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
done
echo "$ArrayUtils_INDEX_NOT_FOUND"
Log.out $LINENO; return "$APASH_FAILURE"
}
ArrayUtils.nullToEmpty() {
Log.in $LINENO "$@"
local inArrayName="${1:-}"
ShellUtils.isVariableNameValid "$inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
ArrayUtils.isArray "$inArrayName" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
ShellUtils.isDeclared "$inArrayName" && { Log.ex $LINENO; return "$APASH_FAILURE"; }
ShellUtils.declareArray "$inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.remove() {
Log.in $LINENO "$@"
[ $# -ne 2 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
local ioArrayName="${1:-}"
local inIndex="${2:-}"
local i
ArrayUtils.isArray "$ioArrayName"                       || { Log.ex $LINENO; return "$APASH_FAILURE"; }
ArrayUtils.isArrayIndexValid "$ioArrayName" "$inIndex"  || { Log.ex $LINENO; return "$APASH_FAILURE"; }
local -a apash_outArray=()
if [ "$APASH_SHELL" = "zsh" ]; then
apash_outArray=("${${(P)ioArrayName}[@]:0:$((inIndex-APASH_ARRAY_FIRST_INDEX))}" \
"${${(P)ioArrayName}[@]:$((inIndex-APASH_ARRAY_FIRST_INDEX+1))}")
else
ArrayUtils.clone "$ioArrayName" apash_outArray || { Log.ex $LINENO; return "$APASH_FAILURE"; }
unset "apash_outArray[$inIndex]"
for i in "${!apash_outArray[@]}"; do
[[ $i -lt $inIndex ]] && continue
apash_outArray[i-1]=${apash_outArray[i]}
unset "apash_outArray[$i]"
done
fi
ArrayUtils.clone "apash_outArray" "$ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.removeAll() {
Log.in $LINENO "$@"
[ $# -lt 2 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
local ioArrayName="${1:-}"
local -a indexes=()
local index=""
local -i i
shift  
for index in "$@"; do
ArrayUtils.isArrayIndexValid "$ioArrayName" "$index"  || { Log.ex $LINENO; return "$APASH_FAILURE"; }
indexes+=("$index")
done
ArrayUtils.removeDuplicates "indexes" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Array.sort "indexes"                  || { Log.ex $LINENO; return "$APASH_FAILURE"; }
local apash_ArrayUtils_removeAll_outArray=()
ArrayUtils.clone "$ioArrayName" "apash_ArrayUtils_removeAll_outArray" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
for (( i=APASH_ARRAY_FIRST_INDEX+${#indexes[@]}-1; i >= APASH_ARRAY_FIRST_INDEX; i-- )); do
ArrayUtils.remove "apash_ArrayUtils_removeAll_outArray" "${indexes[i]}" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
done
ArrayUtils.clone "apash_ArrayUtils_removeAll_outArray" "$ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.removeAllOccurrences() {
Log.in $LINENO "$@"
[ $# -ne 2 ] && return "$APASH_FAILURE"
local apash_ArrayUtils_rao_ioArrayName="${1:-}"
local apash_inValue="${2:-}"
local apash_lastIndex
local -a apash_ArrayUtils_rao_outArray=()
local -i apash_i
apash_lastIndex=$(ArrayUtils.getLastIndex "$apash_ArrayUtils_rao_ioArrayName")       || { Log.ex $LINENO; return "$APASH_FAILURE"; }
ArrayUtils.clone "$apash_ArrayUtils_rao_ioArrayName" "apash_ArrayUtils_rao_outArray" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
for (( apash_i=apash_lastIndex; apash_i >= APASH_ARRAY_FIRST_INDEX; apash_i-- )); do
if [[ "${apash_ArrayUtils_rao_outArray[apash_i]:-}" == "$apash_inValue" ]]; then
ArrayUtils.remove "apash_ArrayUtils_rao_outArray" $apash_i || { Log.ex $LINENO; return "$APASH_FAILURE"; }
fi
done
ArrayUtils.clone "apash_ArrayUtils_rao_outArray" "$apash_ArrayUtils_rao_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.removeDuplicates() {
Log.in $LINENO "$@"
local apash_ioArrayName="${1:-}"
local apash_lastIndex
local -a apash_uniqueArray=()
local -i apash_i
apash_lastIndex=$(ArrayUtils.getLastIndex "$apash_ioArrayName") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [ "$APASH_SHELL" = "zsh" ]; then
for (( apash_i=APASH_ARRAY_FIRST_INDEX; apash_i <= apash_lastIndex ; apash_i++ )); do
ArrayUtils.contains "apash_uniqueArray" "${${(P)apash_ioArrayName}[apash_i]}" || apash_uniqueArray+=("${${(P)apash_ioArrayName}[apash_i]}")
done
else
local -n ioArray="$apash_ioArrayName"
for (( apash_i=APASH_ARRAY_FIRST_INDEX; apash_i <= apash_lastIndex ; apash_i++ )); do
ArrayUtils.contains "apash_uniqueArray" "${ioArray[apash_i]}" || apash_uniqueArray+=( "${ioArray[apash_i]}")
done
fi
ArrayUtils.clone "apash_uniqueArray" "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.removeElement() {
Log.in $LINENO "$@"
[ $# -ne 2 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
local ioArrayName="${1:-}"
local inValue="${2:-}"
local index
ArrayUtils.isArray "$ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
index=$(ArrayUtils.indexOf "$ioArrayName" "$inValue")
[[ "$index" = "$ArrayUtils_INDEX_NOT_FOUND" ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
ArrayUtils.remove "$ioArrayName" "$index"      || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.removeElements() {
Log.in $LINENO "$@"
[ $# -lt 2 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
local ioArrayRef="${1:-}"
ArrayUtils.isArray "$ioArrayRef" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
for value in "$@"; do
ArrayUtils.removeElement "$ioArrayRef" "$value" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
done
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.reverse() {
Log.in $LINENO "$@"
local apash_ioArrayName="${1:-}"
local apash_inStartIndex="${2:-0}"
local apash_inEndIndex="${3:-}"
local apash_swap=""
local -a apash_outArray=()
local apash_lastIndex
ArrayUtils.clone "$apash_ioArrayName" "apash_outArray"           || { Log.ex $LINENO; return "$APASH_FAILURE"; }
apash_lastIndex=$(ArrayUtils.getLastIndex "$apash_ioArrayName")  || { Log.ex $LINENO; return "$APASH_FAILURE"; }
[[ -z "$apash_inEndIndex" ]] && apash_inEndIndex=$((apash_lastIndex+1))
NumberUtils.isLong "$apash_inStartIndex" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
NumberUtils.isLong "$apash_inEndIndex"   || { Log.ex $LINENO; return "$APASH_FAILURE"; }
[[ $apash_inStartIndex -ge $apash_lastIndex ]]         && { Log.out $LINENO; return "$APASH_SUCCESS"; }
[[ $apash_inEndIndex   -le $APASH_ARRAY_FIRST_INDEX ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
[[ $apash_inStartIndex -lt $APASH_ARRAY_FIRST_INDEX ]] && apash_inStartIndex=$APASH_ARRAY_FIRST_INDEX
[[ $apash_inEndIndex   -gt $apash_lastIndex ]]         && apash_inEndIndex=$((apash_lastIndex+1))
[[ "$apash_inStartIndex" -ge "$apash_inEndIndex" ]]    && { Log.out $LINENO; return "$APASH_SUCCESS"; }
while [[ $apash_inStartIndex -lt $apash_inEndIndex ]]; do
apash_swap=${apash_outArray[apash_inStartIndex]}
apash_outArray[apash_inStartIndex]=${apash_outArray[apash_inEndIndex-1]}
apash_outArray[apash_inEndIndex-1]="$apash_swap"
apash_inStartIndex=$((apash_inStartIndex + 1))
apash_inEndIndex=$((apash_inEndIndex - 1))
done
ArrayUtils.clone "apash_outArray" "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.shift() {
Log.in $LINENO "$@"
local apash_ioArrayName="${1:-}"
local apash_inOffset="${2:-0}"
local apash_inStartIndex="${3:-0}"
local apash_inEndIndex="${4:-}"
local apash_distance=0
local apash_distance_offset=0
local apash_lastIndex
local -a apash_outArray=()
ArrayUtils.clone "$apash_ioArrayName" "apash_outArray" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
apash_lastIndex=$(ArrayUtils.getLastIndex "$apash_ioArrayName") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
[ -z "$apash_inEndIndex" ] && apash_inEndIndex=$((apash_lastIndex+1))
NumberUtils.isLong "$apash_inOffset"     || { Log.ex $LINENO; return "$APASH_FAILURE"; }
NumberUtils.isLong "$apash_inStartIndex" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
NumberUtils.isLong "$apash_inEndIndex"   || { Log.ex $LINENO; return "$APASH_FAILURE"; }
[[ $apash_inStartIndex -ge $apash_lastIndex ]]               && { Log.out $LINENO; return "$APASH_SUCCESS"; }
[[ $apash_inEndIndex   -le $APASH_ARRAY_FIRST_INDEX ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
[[ $apash_inStartIndex -lt $APASH_ARRAY_FIRST_INDEX ]] && apash_inStartIndex=$APASH_ARRAY_FIRST_INDEX
[[ $apash_inEndIndex   -gt $apash_lastIndex ]] && apash_inEndIndex=$((apash_lastIndex+1))
apash_distance=$((apash_inEndIndex - apash_inStartIndex))
[[ $apash_distance -le 1 ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
apash_inOffset=$((apash_inOffset%(apash_distance)))
while [[ $apash_distance -gt 1 && $apash_inOffset -gt 0 ]]; do
apash_distance_offset=$((apash_distance - apash_inOffset))
if [[ $apash_inOffset -gt $apash_distance_offset ]]; then
ArrayUtils.swap "apash_outArray" "$apash_inStartIndex" $((apash_inStartIndex + apash_distance - apash_distance_offset)) $apash_distance_offset
apash_distance=$apash_inOffset
apash_inOffset=$((apash_inOffset - apash_distance_offset))
elif [[ $apash_inOffset -lt  $apash_distance_offset ]]; then
ArrayUtils.swap "apash_outArray" "$apash_inStartIndex" $((apash_inStartIndex + apash_distance_offset)) $apash_inOffset
apash_inStartIndex=$((apash_inStartIndex + apash_inOffset))
apash_distance=$apash_distance_offset
else
ArrayUtils.swap "apash_outArray" "$apash_inStartIndex" $((apash_inStartIndex + apash_distance_offset)) $apash_inOffset
break;
fi
done
ArrayUtils.clone "apash_outArray" "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.shuffle() {
Log.in $LINENO "$@"
local apash_ioArrayName="${1:-}"
local -i apash_i
local -a apash_outArray=()
ArrayUtils.clone "$apash_ioArrayName" "apash_outArray" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
for (( apash_i=${#apash_outArray[@]}; apash_i > 1; apash_i-- )); do
ArrayUtils.swap "apash_outArray" $((apash_i - 1)) "$(Random.nextInt 0 $apash_i)" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
done
ArrayUtils.clone "apash_outArray" "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.subarray() {
Log.in $LINENO "$@"
local apash_outSubArrayName="${1:-}"
local apash_inArrayName="${2:-}"
local apash_inStartIndex="${3:-}"
local apash_inEndIndex="${4:-}"
local -a apash_inArray=()
local -a apash_outArray=()
local apash_lastIndex
ArrayUtils.isArray "$apash_inArrayName"  || { Log.ex $LINENO; return "$APASH_FAILURE"; }
NumberUtils.isLong "$apash_inStartIndex" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
NumberUtils.isLong "$apash_inEndIndex"   || { Log.ex $LINENO; return "$APASH_FAILURE"; }
ArrayUtils.clone "$apash_inArrayName" "apash_inArray"           || { Log.ex $LINENO; return "$APASH_FAILURE"; }
apash_lastIndex=$(ArrayUtils.getLastIndex "$apash_inArrayName") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
[[ $apash_inStartIndex -gt $apash_lastIndex         ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
[[ $apash_inStartIndex -lt $APASH_ARRAY_FIRST_INDEX ]] && apash_inStartIndex=$APASH_ARRAY_FIRST_INDEX
[[ $apash_inEndIndex   -lt $APASH_ARRAY_FIRST_INDEX ]] && apash_inEndIndex=$APASH_ARRAY_FIRST_INDEX
[[ $apash_inEndIndex   -gt $apash_lastIndex         ]] && apash_inEndIndex=$((apash_lastIndex+1))
[[ $apash_inStartIndex -gt $apash_inEndIndex        ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
apash_outArray=("${apash_inArray[@]:$apash_inStartIndex-$APASH_ARRAY_FIRST_INDEX:$apash_inEndIndex-$apash_inStartIndex}")
ArrayUtils.clone "apash_outArray" "$apash_outSubArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.swap() {
Log.in $LINENO "$@"
local apash_ioArrayName="${1:-}"
local apash_inStartIndex="${2:-}"
local apash_inEndIndex="${3:-}"
local apash_inLen="${4:-1}"
local apash_swap=""
local -i i  
local -a apash_ArrayUtils_swap_outArray=()
local apash_lastIndex
NumberUtils.isLong "$apash_inStartIndex" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
NumberUtils.isLong "$apash_inEndIndex"   || { Log.ex $LINENO; return "$APASH_FAILURE"; }
NumberUtils.isLong "$apash_inLen"        || { Log.ex $LINENO; return "$APASH_FAILURE"; }
ArrayUtils.clone "$apash_ioArrayName" "apash_ArrayUtils_swap_outArray"    || { Log.ex $LINENO; return "$APASH_FAILURE"; }
apash_lastIndex=$(ArrayUtils.getLastIndex "$apash_ioArrayName") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
[[ $apash_inStartIndex -gt $apash_lastIndex ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
[[ $apash_inEndIndex   -gt $apash_lastIndex ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
[[ $apash_inStartIndex -lt $APASH_ARRAY_FIRST_INDEX ]] && apash_inStartIndex=$APASH_ARRAY_FIRST_INDEX
[[ $apash_inEndIndex   -lt $APASH_ARRAY_FIRST_INDEX ]] && apash_inEndIndex=$APASH_ARRAY_FIRST_INDEX
apash_inLen=$(Math.min "$(Math.min "$apash_inLen" $((apash_lastIndex+1-apash_inStartIndex)))" $((apash_lastIndex+1-apash_inEndIndex)))
for (( i=0; i < apash_inLen; i++, apash_inStartIndex++, apash_inEndIndex++ )); do
apash_swap=${apash_ArrayUtils_swap_outArray[$apash_inStartIndex]}
apash_ArrayUtils_swap_outArray[apash_inStartIndex]=${apash_ArrayUtils_swap_outArray[$apash_inEndIndex]}
apash_ArrayUtils_swap_outArray[apash_inEndIndex]=$apash_swap
done
ArrayUtils.clone "apash_ArrayUtils_swap_outArray" "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils.toArray() {
Log.in $LINENO "$@"
[ $# -lt 1 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
local apash_ioArrayName="${1:-}" 
local -a apash_outArray=()
shift
apash_outArray=("$@")
ArrayUtils.clone "apash_outArray" "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ArrayUtils_INDEX_NOT_FOUND="-1"
ArrayUtils_EMPTY_ARRAY=()
commons-lang.ArrayUtils() { true; }
commons-lang.ShellUtils() { true; }
CsvUtils.merge() {
Log.in $LINENO "$@"
local inFile1="${1:-}"
local inFile2="${2:-}"
local -A functionMap=()
local -a keys=()
local functionName
local header1 header2
local -i nbFields1=0 nbFields2=0
header1="$(head -n 1 "$inFile1")"
header2="$(head -n 1 "$inFile2")"
nbFields1=$(StringUtils.countMatches "$header1" ",")
nbFields2=$(StringUtils.countMatches "$header2" ",")
while IFS= read -r line; do
functionName=${line%%,*}
functionMap[$functionName]="$line"
done < <(tail -n +2 "$inFile1")
while IFS= read -r line; do
functionName=${line%%,*}
if MapUtils.containsKey functionMap "$functionName"; then
functionMap[$functionName]+=",${line#*,}"
else
functionMap[$functionName]="${functionName}$(StringUtils.repeat "$nbFields1" ","),${line#*,}"
fi
done < <(tail -n +2 "$inFile2")
echo "$header1,${header2#*,}"
MapUtils.getKeys "keys" "functionMap"
for functionName in "${keys[@]}"; do
if [[ $(StringUtils.countMatches "${functionMap["$functionName"]}" "," ) -eq $nbFields1 ]]; then
functionMap[$functionName]+="$(StringUtils.repeat "$((nbFields2-1))" ",")"
fi
echo "${functionMap[$functionName]}"
done 
Log.out $LINENO; return "$APASH_SUCCESS"
}
commons-lang.CsvUtils() { true; }
DateUtils.add() {
Log.in $LINENO "$@"
local inDate="${1:-}"
local inAmount="${2:-}"
local inType="${3:-}"
local amount=$inAmount
local type="$inType"
local types=("years" "months" "weeks" "days" "hours" "minutes" "seconds" "milliseconds")
ArrayUtils.contains "types" "$inType" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
DateUtils.isDate    "$inDate"         || { Log.ex $LINENO; return "$APASH_FAILURE"; }
NumberUtils.isLong  "$inAmount"       || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [ "$inType" = "milliseconds" ]; then
type="seconds"
amount=$(printf "%.3f\n" "$(echo "scale=3; $inAmount / 1000" | bc)")
fi
date -d "$inDate + $amount $type" "$DateUtils_UTC_FORMAT" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
DateUtils.addDays() {
Log.in $LINENO "$@"
local inDate="${1:-}"
local inAmount="${2:-0}"
DateUtils.add "$inDate" "$inAmount" "days" || { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
DateUtils.addHours() {
local inDate="${1:-}"
local inAmount="${2:-0}"
DateUtils.add "$inDate" "$inAmount" "hours" || { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
DateUtils.addMinutes() {
local inDate="${1:-}"
local inAmount="${2:-0}"
DateUtils.add "$inDate" "$inAmount" "minutes" || { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
DateUtils.addMonths() {
local inDate="${1:-}"
local inAmount="${2:-0}"
DateUtils.add "$inDate" "$inAmount" "months" || { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
DateUtils.addSeconds() {
Log.in $LINENO "$@"
local inDate="${1:-}"
local inAmount="${2:-0}"
DateUtils.add "$inDate" "$inAmount" "seconds" || { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
DateUtils.addWeeks() {
Log.in $LINENO "$@"
local inDate="${1:-}"
local inAmount="${2:-0}"
DateUtils.add "$inDate" "$inAmount" "weeks" || { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
DateUtils.addYears() {
Log.in $LINENO "$@"
local inDate="${1:-}"
local inAmount="${2:-0}"
DateUtils.add "$inDate" "$inAmount" "years" || { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
DateUtils.isDate() {
Log.in $LINENO "$@"
local inDate="${1:-}"
local datePattern="^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{3}\+[0-9]{4}$"
[[ ! $inDate =~ $datePattern ]]    && { Log.out $LINENO; return "$APASH_FAILURE"; }
date -d "$inDate" > /dev/null 2>&1 || { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
DateUtils_UTC_FORMAT="+%FT%T.%3N%z"
commons-lang.DateUtils() { true; }
MapUtils.clone() {
Log.in $LINENO "$@"
local apash_MapUtils_clone_inMapName="${1:-}"
local apash_MapUtils_clone_outMapName="${2:-}"
MapUtils.isMap   "$apash_MapUtils_clone_inMapName"  || { Log.out $LINENO; return "$APASH_FAILURE"; }
MapUtils.init    "$apash_MapUtils_clone_outMapName" || { Log.out $LINENO; return "$APASH_FAILURE"; }
if [ "$APASH_SHELL" = "zsh" ]; then
: ${(PAA)apash_MapUtils_clone_outMapName::="${(AAkv@)${(P)apash_MapUtils_clone_inMapName}}"} && { Log.out $LINENO; return "$APASH_SUCCESS"; }
else
local -n apash_MapUtils_clone_inMap="$apash_MapUtils_clone_inMapName"
local -n apash_MapUtils_clone_outMap="$apash_MapUtils_clone_outMapName"
local apash_key
for apash_key in "${!apash_MapUtils_clone_inMap[@]}"; do
apash_MapUtils_clone_outMap["$apash_key"]="${apash_MapUtils_clone_inMap["$apash_key"]}"
done
Log.out $LINENO; return "$APASH_SUCCESS"
fi
Log.out $LINENO; return "$APASH_FAILURE"
}
MapUtils.containsKey() {
Log.in $LINENO "$@"
local apash_inMapName="${1:-}"
local apash_inKey="${2:-}"
local apash_k
MapUtils.isMap "$apash_inMapName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [ "$APASH_SHELL" = "zsh" ]; then
for apash_k in "${(@kP)apash_inMapName}"; do
[[ "$apash_k" == "$apash_inKey" ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
done
else
local -n inMap="$apash_inMapName"
for apash_k in "${!inMap[@]}"; do
[[ "$apash_k" == "$apash_inKey" ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
done
fi
Log.out $LINENO; return "$APASH_FAILURE"
}
MapUtils.getKeys() {
Log.in $LINENO "$@"
local apash_outArrayName="${1:-}"
local apash_inMapName="${2:-}"
local -a apash_outArray=()
MapUtils.isMap "$apash_inMapName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [ "$APASH_SHELL" = "zsh" ]; then
apash_outArray=("${(@kP)apash_inMapName}")
else # bash
local -n inMap="$apash_inMapName"
apash_outArray=("${!inMap[@]}")
fi
ArrayUtils.clone "apash_outArray" "$apash_outArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
MapUtils.init() {
Log.in $LINENO "$@"
local apash_MapUtils_init_ioMapName="${1:-}"
ShellUtils.isVariableNameValid "$apash_MapUtils_init_ioMapName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
ShellUtils.isVariable "$apash_MapUtils_init_ioMapName"          && { Log.ex $LINENO; return "$APASH_FAILURE"; }
ArrayUtils.isArray "$apash_MapUtils_init_ioMapName"            && { Log.ex $LINENO; return "$APASH_FAILURE"; }
if ! ShellUtils.isDeclared "$apash_MapUtils_init_ioMapName"; then
ShellUtils.declareArray "$apash_MapUtils_init_ioMapName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
fi
if [ "$APASH_SHELL" = "zsh" ]; then
: ${(PAA)apash_MapUtils_init_ioMapName::=${(kv)${MaptUtils_EMPTY_MAP:-}}} && { Log.out $LINENO; return "$APASH_SUCCESS"; }
else
local -n apash_ArrayUtils_init_outArray="$apash_MapUtils_init_ioMapName"
apash_ArrayUtils_init_outArray=() && { Log.out $LINENO; return "$APASH_SUCCESS"; }
fi
Log.out $LINENO; return "$APASH_FAILURE"
}
MapUtils.isMap() {
Log.in $LINENO "$@"
declare -p "${1:-}" 2> /dev/null | grep -q "^\(declare\|typeset\).* -A " || { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
declare -A MaptUtils_EMPTY_MAP=()
commons-lang.MapUtils() { true; }
MatrixUtils.create() {
Log.in $LINENO "$@"
[[ $# -lt 3 ]] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
local inArrayName="${1:-}"
local matrixDim="${MatrixUtils_DIM_ARRAY_PREFIX}${inArrayName}"
local dim
local nbDim="$APASH_ARRAY_FIRST_INDEX"
ArrayUtils.nullToEmpty "$inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
shift
local dimensions=("$@")
unset "$matrixDim"
for dim in "${dimensions[@]}"; do
if ! ArrayUtils.isArrayIndex "$dim" || [[ $dim -eq 0 ]]  ; then
unset "$matrixDim"
return "$APASH_FAILURE"
fi
(( ${matrixDim}[$nbDim]=$dim ))
nbDim=$((nbDim+1))
done
Log.out $LINENO; return "$APASH_SUCCESS"
}
MatrixUtils.get() {
Log.in $LINENO "$@"
local apash_matrixName="${1:-}"
MatrixUtils.isMatrix "$apash_matrixName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
local -i apash_cellIndex=0
shift
apash_cellIndex=$(MatrixUtils.getIndex "$apash_matrixName" "$@") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [ "$APASH_SHELL" = "zsh" ]; then
echo "${${(P)apash_matrixName}[$apash_cellIndex]}" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
else # bash
local -n apash_matrix="$apash_matrixName"
echo "${apash_matrix[$apash_cellIndex]}" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
fi
Log.out $LINENO; return "$APASH_FAILURE"
}
MatrixUtils.getDim() {
Log.in $LINENO "$@"
[ $# -lt 2 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
local inArrayName="${1:-}"
local matrixName="${2:-}"
shift 2
local indexes=("$@")
local start=$APASH_ARRAY_FIRST_INDEX
local length=0
ArrayUtils.nullToEmpty "$inArrayName"                              || { Log.ex $LINENO; return "$APASH_FAILURE"; }
MatrixUtils.isMatrix   "$matrixName"                               || { Log.ex $LINENO; return "$APASH_FAILURE"; }
start=$(MatrixUtils.getIndex "$matrixName" "${indexes[@]:-}")      || { Log.ex $LINENO; return "$APASH_FAILURE"; }
length=$(MatrixUtils.getDimOffset "$matrixName" "${indexes[@]:-}") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
[[ $length -le 0 ]] && length=1
ArrayUtils.subarray "$inArrayName" "$matrixName" "$start" $((start + length)) || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
MatrixUtils.getDimLastIndex() {
Log.in $LINENO "$@"
[ $# -lt 1 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
local apash_matrixName="${1:-}"
shift
local apash_indexes=("$@")
local -i apash_dimOffset
local -i apash_lastIndex
MatrixUtils.isMatrix "$apash_matrixName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
curIndex=$(MatrixUtils.getIndex "$apash_matrixName" ${apash_indexes[@]:-}) || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [ "$APASH_SHELL" = "zsh" ]; then
local -a apash_matrixDim=()
ArrayUtils.clone "${MatrixUtils_DIM_ARRAY_PREFIX}${apash_matrixName}" "apash_matrixDim" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
else # bash
local -n apash_matrixDim="${MatrixUtils_DIM_ARRAY_PREFIX}${apash_matrixName}"
fi
if [[ ${#apash_indexes[@]} -eq ${#apash_matrixDim[@]} ]]; then
firstIndex=$((curIndex-apash_indexes[-1]))
unset 'apash_indexes[${#apash_indexes[@]}-1]'
else
firstIndex=$curIndex
fi
apash_dimOffset=$(MatrixUtils.getDimOffset "$apash_matrixName" ${apash_indexes[@]:-}) || { Log.ex $LINENO; return "$APASH_FAILURE"; }
apash_lastIndex=$((firstIndex + apash_dimOffset - 1))
echo "$apash_lastIndex" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
MatrixUtils.getDimOffset() {
Log.in $LINENO "$@"
[ $# -lt 1 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
local apash_matrixName="${1:-}"
shift
local apash_indexes=("$@")
local apash_dimOffset=0
local -i apash_i
[ -z "${apash_indexes[APASH_ARRAY_FIRST_INDEX]:-}" ] && apash_indexes=()
MatrixUtils.isMatrix "$apash_matrixName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
local apash_dimMatrixName="${MatrixUtils_DIM_ARRAY_PREFIX}${apash_matrixName}"
if [ "$APASH_SHELL" = "zsh" ]; then
for (( apash_i=${#apash_indexes[@]}; apash_i < ${#${(P)apash_dimMatrixName}[@]}; apash_i++ )); do
[[ $apash_dimOffset -gt 0 ]] && apash_dimOffset=$((apash_dimOffset * ${${(P)apash_dimMatrixName}[APASH_ARRAY_FIRST_INDEX+apash_i]})) || apash_dimOffset=${${(P)apash_dimMatrixName}[APASH_ARRAY_FIRST_INDEX+apash_i]}
done
else # bash
local -n apash_matrixDim="$apash_dimMatrixName"
for (( apash_i=${#apash_indexes[@]}; apash_i < ${#apash_matrixDim[@]}; apash_i++ )); do
[[ $apash_dimOffset -gt 0 ]] && apash_dimOffset=$((apash_dimOffset * apash_matrixDim[apash_i])) || apash_dimOffset=${apash_matrixDim[apash_i]}
done
fi
[ "$apash_dimOffset" -le 0 ] && apash_dimOffset=1
echo "$apash_dimOffset" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
MatrixUtils.getIndex() {
Log.in $LINENO "$@"
[ $# -lt 1 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
local apash_matrixName="${1:-}"
shift
local apash_indexes=("$@")
local -i apash_offset=0
local -i apash_cellIndex=APASH_ARRAY_FIRST_INDEX
local -i apash_i
MatrixUtils.isMatrix "$apash_matrixName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [ "$APASH_SHELL" = "zsh" ]; then
local -a matrixDim=()
ArrayUtils.clone "${MatrixUtils_DIM_ARRAY_PREFIX}${apash_matrixName}" "matrixDim"
else # bash
local -n matrixDim="${MatrixUtils_DIM_ARRAY_PREFIX}${apash_matrixName}"
fi
[[ ${#apash_indexes[@]} -gt ${#matrixDim[@]} ]] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
for (( apash_i=APASH_ARRAY_FIRST_INDEX; apash_i < APASH_ARRAY_FIRST_INDEX+${#matrixDim[@]}; apash_i++ )); do
[[ -z "${apash_indexes[apash_i]:-}" ]] && apash_indexes[apash_i]=0
[[ ${apash_indexes[apash_i]} -ge ${matrixDim[apash_i]} ]] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
done
apash_offset=${matrixDim[-1]}
for (( apash_i=APASH_ARRAY_FIRST_INDEX+${#matrixDim[@]}-2; apash_i > APASH_ARRAY_FIRST_INDEX; apash_i-- )); do
apash_offset=$((apash_offset * matrixDim[apash_i] ))
done
for (( apash_i=APASH_ARRAY_FIRST_INDEX; apash_i < APASH_ARRAY_FIRST_INDEX+${#apash_indexes[@]}-1; apash_i++ )); do
apash_cellIndex=$((apash_cellIndex + (apash_indexes[apash_i] * apash_offset)))
apash_offset=$((apash_offset - matrixDim[apash_i]))
done
apash_cellIndex=$(( apash_cellIndex + ${apash_indexes[-1]}))  
echo "$apash_cellIndex" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
MatrixUtils.isMatrix() {
Log.in $LINENO "$@"
local apash_inArrayName="${1:-}"
local apash_dimMatrixName="${MatrixUtils_DIM_ARRAY_PREFIX}${apash_inArrayName}"
local -i apash_i
ArrayUtils.isArray "$apash_inArrayName"        || { Log.out $LINENO; return "$APASH_FAILURE"; }
ArrayUtils.isArray "$apash_dimMatrixName" || { Log.out $LINENO; return "$APASH_FAILURE"; }
if [ "$APASH_SHELL" = "zsh" ]; then
for apash_i in "${${(P)apash_dimMatrixName}[@]}"; do
ArrayUtils.isArrayIndex "$apash_i" || { Log.out $LINENO; return "$APASH_FAILURE"; }
[ "$apash_i" -eq 0 ]               && { Log.out $LINENO; return "$APASH_FAILURE"; }
done
else
local -n inMatrixDim="$apash_dimMatrixName"
for apash_i in "${inMatrixDim[@]}"; do
ArrayUtils.isArrayIndex "$apash_i" || { Log.out $LINENO; return "$APASH_FAILURE"; }
[ "$apash_i" -eq 0 ]               && { Log.out $LINENO; return "$APASH_FAILURE"; }
done
fi
Log.out $LINENO; return "$APASH_SUCCESS"
}
MatrixUtils.set() {
Log.in $LINENO "$@"
[ $# -lt 2 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
local apash_matrixName="${1:-}"
local apash_value="${2:-}"
local -i apash_cellIndex=$APASH_ARRAY_FIRST_INDEX
shift 2
MatrixUtils.isMatrix "$apash_matrixName"                   || { Log.ex $LINENO; return "$APASH_FAILURE"; }
apash_cellIndex=$(MatrixUtils.getIndex "$apash_matrixName" "$@") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [ "$APASH_SHELL" = "zsh" ]; then
local -a matrix=()
ArrayUtils.clone "$apash_matrixName" "matrix" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
matrix[apash_cellIndex]="$apash_value"        || { Log.ex $LINENO; return "$APASH_FAILURE"; }
ArrayUtils.clone "matrix" "$apash_matrixName" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
else
local -n matrix="$apash_matrixName"
matrix[apash_cellIndex]="$apash_value" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
fi
Log.out $LINENO; return "$APASH_FAILURE"
}
MatrixUtils.setDim() {
Log.in $LINENO "$@"
[ $# -lt 2 ] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
local apash_inMatrixName="${1:-}"
local apash_inArrayName="${2:-}"
shift 2
local apash_indexes=("$@")
local -i apash_start=$APASH_ARRAY_FIRST_INDEX
local -i apash_lastDimIndex=0
local -i apash_i
MatrixUtils.isMatrix "$apash_inMatrixName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
ArrayUtils.isArray "$apash_inArrayName"    || { Log.ex $LINENO; return "$APASH_FAILURE"; }
apash_start=$(MatrixUtils.getIndex "$apash_inMatrixName" "${apash_indexes[@]}")               || { Log.ex $LINENO; return "$APASH_FAILURE"; }
apash_lastDimIndex=$(MatrixUtils.getDimLastIndex "$apash_inMatrixName" "${apash_indexes[@]}") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
local -a inMatrix=()
local -a inArray=()
ArrayUtils.clone "$apash_inMatrixName" "inMatrix" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
ArrayUtils.clone "$apash_inArrayName"  "inArray"  || { Log.ex $LINENO; return "$APASH_FAILURE"; }
[[ $((apash_start + ${#inArray[@]}-1)) -gt ${apash_lastDimIndex} ]] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
for (( apash_i=apash_start; apash_i < apash_lastDimIndex+1; apash_i++ )); do
inMatrix[apash_i]=${inArray[APASH_ARRAY_FIRST_INDEX+apash_i-apash_start]}
done
ArrayUtils.clone "inMatrix" "$apash_inMatrixName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
MatrixUtils.toString() {
Log.in $LINENO "$@"
local apash_matrixName="${1:-}"
local apash_matrix_toString
local -i apash_i
local -i apash_j
MatrixUtils.isMatrix "$apash_matrixName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [ "$APASH_SHELL" = "zsh" ]; then
local -a apash_matrix=()
ArrayUtils.clone "$apash_matrixName" "apash_matrix" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
else # bash
local -n apash_matrix="$apash_matrixName"
local -n apash_matrixDim="${MatrixUtils_DIM_ARRAY_PREFIX}${apash_matrixName}"
fi
ArrayUtils.clone "apash_matrixDim" "apash_matrix_toString"
for (( apash_i=0; apash_i < ${#apash_matrixDim[@]}; apash_i++ )); do
[[ $apash_i == 0 ]] && totalIndexes=${apash_matrixDim[apash_i]} || totalIndexes=$((totalIndexes * apash_matrixDim[apash_i]))
apash_matrix_toString[apash_i]=0
done
for (( apash_i=0; apash_i < totalIndexes; apash_i++ )); do
echo "$apash_matrixName($(ArrayUtils.join apash_matrix_toString ","))=${apash_matrix[apash_i]} "
apash_matrix_toString[-1]=$((apash_matrix_toString[-1]+1))
for (( apash_j=${#apash_matrix_toString[@]}-1; apash_j > 0; apash_j--)); do
if [[ ${apash_matrix_toString[apash_j]} -ge ${apash_matrixDim[apash_j]} ]]; then
apash_matrix_toString[apash_j]=0
apash_matrix_toString[apash_j-1]=$((apash_matrix_toString[apash_j-1]+1))
fi
done
done
Log.out $LINENO; return "$APASH_SUCCESS"
}
MatrixUtils_DIM_ARRAY_PREFIX="_apash_matrix_dim_"
commons-lang.MatrixUtils() { true; }
NumberUtils.compare() {
Log.in $LINENO "$@"
local inNumber1="${1:-}"
local inNumber2="${2:-}"
NumberUtils.isLong "$inNumber1" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
NumberUtils.isLong "$inNumber2" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
echo $((inNumber1 - inNumber2)) && { Log.out $LINENO; return "$APASH_SUCCESS"; }
Log.out $LINENO; return "$APASH_FAILURE"
}
NumberUtils.isDigits() {
Log.in $LINENO "$@"
local inNumber="${1:-}"
local pattern="^[0-9]+$"
[[ $inNumber =~ $pattern ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
Log.out $LINENO; return "$APASH_FAILURE"
}
NumberUtils.isInteger() {
Log.in $LINENO "$@"
local inNumber="${1:-}"
[[ ! $inNumber =~ ^-?[0-9]+$ ]]        && { Log.out $LINENO; return "$APASH_FAILURE"; }
[[ $inNumber -gt $Integer_MAX_VALUE ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
[[ $inNumber -lt $Integer_MIN_VALUE ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
NumberUtils.isLong() {
Log.in $LINENO "$@"
local inNumber="${1:-}"
local pattern="^-?[0-9]{1,19}$"
[[ ! $inNumber =~ $pattern ]] && return "$APASH_FAILURE"
[[ "${inNumber:0:1}" = "-"  && ${#inNumber} -eq 20 && "$inNumber" > "$Long_MIN_VALUE" ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
[[ "${inNumber:0:1}" != "-" && ${#inNumber} -eq 19 && "$inNumber" > "$Long_MAX_VALUE" ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }  
Log.out $LINENO; return "$APASH_SUCCESS"
}
NumberUtils.isLongPositive() {
Log.in $LINENO "$@"
local inNumber="${1:-}"
NumberUtils.isLong "$inNumber" || { Log.out $LINENO; return "$APASH_FAILURE"; }
[[ $inNumber -ge 0 ]]          || { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
NumberUtils.isParsable() {
Log.in $LINENO "$@"
local inNumber="${1:-}"
local pattern="^-?[0-9]*\.?[0-9]+$"
[[ $inNumber =~ $pattern ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
Log.out $LINENO; return "$APASH_FAILURE"
}
NumberUtils.max() {
Log.in $LINENO "$@"
local max="${1:-}"
NumberUtils.isParsable "$max" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
shift
for n in "$@"; do
NumberUtils.isParsable "$n" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
max=$(Math.max "$max" "$n") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
done
echo "$max" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
NumberUtils.min() {
Log.in $LINENO "$@"
local min="${1:-}"
NumberUtils.isParsable "$min" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
shift
for n in "$@"; do
NumberUtils.isParsable "$n" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
min=$(Math.min "$min" "$n") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
done
echo "$min" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
commons-lang.NumberUtils() { true; }
ShellUtils.declareArray() {
Log.in $LINENO "$@"
local varName="${1:-}"
if [ "$APASH_SHELL" = "zsh" ]; then
declare -g -a "$varName"    || { Log.ex $LINENO; return "$APASH_FAILURE"; }
else # bash
declare -g -a "$varName=()" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
fi
Log.out $LINENO; return "$APASH_SUCCESS"
}
ShellUtils.getFunctionName() {
local inDepth="${1:-$((APASH_ARRAY_FIRST_INDEX+1))}"
local functionName
if [ "$APASH_SHELL" = "zsh" ]; then
[ "$inDepth" -gt "${#funcstack[@]}" ] && return "$APASH_FAILURE"
functionName="${funcstack[inDepth]}"
else # bash
[ "$inDepth" -gt "${#FUNCNAME[@]}" ] && return "$APASH_FAILURE"
functionName="${FUNCNAME[inDepth]}"
fi
echo "$functionName" || return "$APASH_FAILURE"
return "$APASH_SUCCESS"
}
ShellUtils.getParentFunctionName() {
ShellUtils.getFunctionName $((APASH_ARRAY_FIRST_INDEX+3)) || return "$APASH_FAILURE"
return "$APASH_SUCCESS"
}
ShellUtils.isCommandValid() {
Log.in $LINENO "$@"
local commandName="${1:-}"
command -v "$commandName" >/dev/null 2>&1 || { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS";
}
ShellUtils.isDeclared() {
Log.in $LINENO "$@"
local varName="${1:-}"
declare -p "$varName" > /dev/null 2>&1 || { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ShellUtils.isVariable() {
Log.in $LINENO "$@"
local varName="${1:-}"
ShellUtils.isDeclared "$varName" || { Log.out $LINENO; return "$APASH_FAILURE"; }
ArrayUtils.isArray   "$varName" && { Log.out $LINENO; return "$APASH_FAILURE"; }
MapUtils.isMap       "$varName" && { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ShellUtils.isVariableNameValid() {
Log.in $LINENO "$@"
local varName="${1:-}"
[ "$varName" = "_" ] && { Log.out $LINENO; return "$APASH_FAILURE"; }
local LC_COLLATE=C
[[ "$varName" =~ ^[a-zA-Z_][a-zA-Z0-9_]*$ ]] || { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
ShellUtils.isZsh() {
Log.in $LINENO "$@"
[[ "$APASH_SHELL" == "zsh" ]] || { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
StringUtils.abbreviate() {
Log.in $LINENO "$@"
local inString="${1:-}"
local inMaxWidth="${2:-}"
local inOffset="${3:-0}"
local inMarker="${4:-...}"
local offset=$inOffset
NumberUtils.isLong "$inMaxWidth" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
NumberUtils.isLong "$inOffset"   || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if (! StringUtils.isEmpty "$inString") && [[ $inMarker = "" && $inMaxWidth -gt 0 ]]; then
StringUtils.substring "$inString" 0 "$inMaxWidth" && return "$APASH_SUCCESS"
return "$APASH_FAILURE"
elif StringUtils.isAnyEmpty "$inString" "$inMarker"; then
echo "$inString" && return "$APASH_SUCCESS"
return "$APASH_FAILURE"
fi
local abbrevMarkerLength=${#inMarker}
local minAbbrevWidth=$((abbrevMarkerLength + 1))
local minAbbrevWidthOffset=$((abbrevMarkerLength + abbrevMarkerLength + 1))
[[ $inMaxWidth -lt $minAbbrevWidth ]] && return "$APASH_FAILURE"
[[ ${#inString} -le $inMaxWidth ]] && echo "$inString" && return "$APASH_SUCCESS"
[[ $offset -gt ${#inString} ]] && offset=${#inString}
if (( ${#inString} - offset < inMaxWidth - abbrevMarkerLength)); then
offset=$(( ${#inString} - (inMaxWidth - abbrevMarkerLength) ))
fi
if (( offset <= abbrevMarkerLength + 1 )); then
echo "$(StringUtils.substring "$inString" 0 $((inMaxWidth - abbrevMarkerLength)))$inMarker" || { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
fi
if ((inMaxWidth < minAbbrevWidthOffset)); then
Log.out $LINENO; return "$APASH_FAILURE"
fi
if (( offset + inMaxWidth - abbrevMarkerLength < ${#inString} )); then
echo "$inMarker$(StringUtils.abbreviate "$(StringUtils.substring "$inString" "$offset")" $((inMaxWidth - abbrevMarkerLength)) 0 "$inMarker")" || { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
fi
echo "$inMarker$(StringUtils.substring "$inString" $((${#inString} - (inMaxWidth - abbrevMarkerLength))))" || { Log.out $LINENO; return "$APASH_FAILURE"; }
return "$APASH_SUCCESS"
}
StringUtils.contains(){
Log.in $LINENO "$@"
local inString="${1:-}"
local inSequence="${2:-}"
[[ -z $inSequence ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
[[ -n $inString && -z $inSequence ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
[[ $inString == *"$inSequence"* ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
Log.out $LINENO; return "$APASH_FAILURE"
}
StringUtils.containsOnly(){
Log.in $LINENO "$@"
local inString="${1:-}"
local inSequence="${2:-}"
[[ -z $inString ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
[[ -n $inString && -z $inSequence ]] && { Log.out $LINENO; return "$APASH_FAILURE"; }
[[ $inString =~ ^[$inSequence]*$ ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
Log.out $LINENO; return "$APASH_FAILURE"
}
StringUtils.countMatches() {
Log.in $LINENO "$@"
local inString="${1:-}"
local inSubstring="${2:-}"
local -i count=0
if [[ -z $inString || -z $inSubstring ]]; then
echo "$count" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
fi
count=$(echo "$inString" | grep -o "$inSubstring" | wc -l)
echo "$count" || { Log.out $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
StringUtils.endsWith(){
Log.in $LINENO "$@"
local inString="${1:-}"
local inSuffix="${2:-}"
if [ "$APASH_SHELL" = "zsh" ]; then
[[ -z "$inSuffix" || "${inString: -${#inSuffix}}" = "$inSuffix" ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
else # bash
[[ "$inString" =~ "${inSuffix}"$ ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
fi
{ Log.out $LINENO; return "$APASH_FAILURE"; }
}
StringUtils.equals() {
Log.in $LINENO "$@"
[[ "${1:-}" == "${2:-}" ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
{ Log.out $LINENO; return "$APASH_FAILURE"; }
}
StringUtils.indexOf() {
Log.in $LINENO "$@"
local inString="${1:-}"
local inResearch="${2:-}"
local index=-1
if [[ -z "$inString" &&  -n "$inResearch" ]]; then
echo "$index" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
fi
if [[ -n "$inString" &&  -z "$inResearch" ]]; then
echo "0" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
fi
if [[ -z "$inString" &&  -z "$inResearch" ]]; then
echo "0" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
fi  
index=${inString%%"${inResearch}"*}
[ ${#index} -eq ${#inString} ] && index=-1 || index=$((${#index}))
echo "$index" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
StringUtils.indexOfAny() {
Log.in $LINENO "$@"
local apash_inString="${1:-}"
local apash_researchName="${2:-}"
local apash_index="$ArrayUtils_INDEX_NOT_FOUND"
local apash_r
local -i apash_i
local -a apash_researh=()
if ! ArrayUtils.clone "$apash_researchName" "research"; then
echo "$ArrayUtils_INDEX_NOT_FOUND" && return "$APASH_SUCCESS"
return "$APASH_FAILURE"
fi
if [[ ${#research[@]} -eq 0 ]]; then
echo "$ArrayUtils_INDEX_NOT_FOUND" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
fi
for apash_r in "${research[@]}"; do
apash_i=$(StringUtils.indexOf "$apash_inString" "$apash_r") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
[[ $apash_i -ge 0  && ($apash_index -eq $ArrayUtils_INDEX_NOT_FOUND || $apash_i -lt $apash_index) ]] && apash_index=$apash_i
done
echo "$apash_index" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
StringUtils.isAlpha() {
Log.in $LINENO "$@"
local pattern="^[[:alpha:]]+$"
[[ ${1:-} =~ $pattern ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
Log.out $LINENO; return "$APASH_FAILURE"
}
StringUtils.isAnyEmpty() {
Log.in $LINENO "$@"
[ $# -eq 0 ] &&  { Log.out $LINENO; return "$APASH_SUCCESS"; }
for s in "$@"; do
[[ -z $s ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
done
Log.out $LINENO; return "$APASH_FAILURE"
}
StringUtils.isBlank() {
Log.in $LINENO "$@"
local inString="${1:-}"
local trimmedString  
trimmedString=$(StringUtils.trim "$inString") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
[ -z "$trimmedString" ] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
Log.out $LINENO; return "$APASH_FAILURE"
}
StringUtils.isEmpty() {
Log.in $LINENO "$@"
[ -z "${1:-}" ] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
Log.out $LINENO; return "$APASH_FAILURE"
}
StringUtils.leftPad() {
Log.in $LINENO "$@"
local inString="${1:-}"
local inSize="${2:-}"
local inPadString="${3:- }"
local leftPadString=""
NumberUtils.isDigits "$inSize" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
local padCount=$((inSize - ${#inString}))
[[ $padCount -le 0 ]] && echo "$inString" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
local padNbPattern=$((padCount / ${#inPadString}))
local padNbRemaining=$((padCount % ${#inPadString}))
leftPadString=$(printf "%${padNbPattern}s")
leftPadString="${leftPadString// /"$inPadString"}"
leftPadString+="${inPadString:0:$padNbRemaining}"
echo "${leftPadString}${inString}" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
Log.out $LINENO; return "$APASH_FAILURE"
}
StringUtils.lowerCase() {
Log.in $LINENO "$@"
local inString="${1:-}"
echo "${inString,,}" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
StringUtils.remove() {
Log.in $LINENO "$@"
local inString="${1:-}"
local inSubstring="${2:-}"
echo "${inString//"$inSubstring"/}" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
StringUtils.remove() {
Log.in $LINENO "$@"
local inString="${1:-}"
local inSubstring="${2:-}"
echo "${inString//"$inSubstring"/}" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
StringUtils.repeat() {
Log.in $LINENO "$@"
local inNumber="${1:-}"
local inString="${2:-}"
local outString=""
local -i i
NumberUtils.isLongPositive "$inNumber" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [[ $APASH_SHELL == "zsh" ]] && \
VersionUtils.isLowerOrEquals "$APASH_SHELL_VERSION" "5.2"; then
for (( i=0; i < inNumber; i++ )); do
outString+="$inString"
done
else
outString=$(printf "%0.s$inString" $(seq 1 "$inNumber")) || { Log.ex $LINENO; return "$APASH_FAILURE"; }
fi
echo "$outString" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
StringUtils.replace() {
Log.in $LINENO "$@"
local inString="${1:-}"
local inSubstring="${2:-}"
local inReplacement="${3:-}"
[ -z "$inSubstring" ] && echo "${inString}"         && { Log.out $LINENO; return "$APASH_SUCCESS"; }
echo "${inString//"$inSubstring"/"$inReplacement"}" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
Log.out $LINENO; return "$APASH_FAILURE"
}
StringUtils.reverse() {
Log.in $LINENO "$@"
local inString="${1:-}"
local reversed_string=""
local -i i
if ShellUtils.isCommandValid "rev"; then
echo "$inString" | rev && { Log.out $LINENO; return "$APASH_SUCCESS"; }
else
[ "$APASH_LOG_WARNING_DEGRADED" = "true" ] && Log.warn $LINENO "**DEGRADED MODE** rev command not found."
for (( i=${#inString}-1; i>=0; i-- )); do
reversed_string="$reversed_string${inString:$i:1}"
done
echo "$reversed_string" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
fi
Log.out $LINENO; return "$APASH_FAILURE"
}
StringUtils.rightPad() {
Log.in $LINENO "$@"
local inString="${1:-}"
local inSize="${2:-}"
local inPadString="${3:- }"
local rightPadString=""
NumberUtils.isDigits "$inSize" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
local padCount=$((inSize - ${#inString}))
[[ $padCount -le 0 ]] && echo "$inString" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
local padNbPattern=$((padCount / ${#inPadString}))
local padNbRemaining=$((padCount % ${#inPadString}))
rightPadString=$(printf "%${padNbPattern}s")
rightPadString="${rightPadString// /"$inPadString"}"
rightPadString+="${inPadString:0:$padNbRemaining}"
echo "${inString}${rightPadString}" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
Log.out $LINENO; return "$APASH_FAILURE"
}
StringUtils.rotate() {
Log.in $LINENO "$@"
local inString="${1:-}"
local inNbChars="${2:-0}"
local outString=""
[[ -z $inNbChars ]] && inNbChars=0
NumberUtils.isInteger "$inNbChars" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
[[ ${#inString} -eq 0 ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
inNbChars=$((inNbChars % ${#inString}))
if [[ $inNbChars -eq 0 ]]; then
outString="$inString"
elif [[ $inNbChars -gt 0 ]]; then
indexFrom=$((${#inString}-inNbChars))
outString="${inString:$indexFrom}${inString:0:$indexFrom}"
else
inNbChars=$(Math.abs "$inNbChars")
outString="${inString:$inNbChars}${inString:0:$inNbChars}"
fi
echo "$outString" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
StringUtils.split() {
Log.in $LINENO "$@"
local apash_inArrayName="${1:-}"
local apash_inString="${2:-}"
local apash_inDelimiter="${3:- }"
local apash_currentString=""
local -i apash_i
local -a apash_outArray=()
apash_inString=${apash_inString##+("$apash_inDelimiter")}
apash_inString=${apash_inString%%+("$apash_inDelimiter")}
for (( apash_i=0; apash_i<${#apash_inString}; apash_i++ )); do
if [[ ${apash_inString:$apash_i:${#apash_inDelimiter}} = "$apash_inDelimiter" && ${#apash_inDelimiter} -gt 0 ]]; then
apash_outArray+=("$apash_currentString")
apash_currentString=""
while [[ ${apash_inString:$apash_i:${#apash_inDelimiter}} = "$apash_inDelimiter" ]]; do
apash_i=$((apash_i + ${#apash_inDelimiter}))
done
apash_i=$((apash_i - 1))
continue
fi
apash_currentString+=${apash_inString:$apash_i:1}
done
[ -n "$apash_currentString" ] && apash_outArray+=("$apash_currentString")
ArrayUtils.clone "apash_outArray" "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
StringUtils.splitAny() {
Log.in $LINENO "$@"
local apash_inArrayName="${1:-}"
local apash_inString="${2:-}"
shift 2
local -a apash_inDelimiters=("${@}")
local apash_currentString=""
local apash_d apash_matchD
local -i apash_i
local -a apash_outArray=()
local tmpStr="x$apash_inString"
while [[ $tmpStr != "$apash_inString" ]]; do
tmpStr="$apash_inString"
for apash_d in "${apash_inDelimiters[@]}"; do
apash_inString=${apash_inString##+("$apash_d")}
done
done
tmpStr="x$apash_inString"
while [[ $tmpStr != "$apash_inString" ]]; do
tmpStr="$apash_inString"
for apash_d in "${apash_inDelimiters[@]}"; do
apash_inString=${apash_inString%%+("$apash_d")}
done
done
for (( apash_i=0; apash_i<${#apash_inString}; apash_i++ )); do
apash_matchD="false"
for apash_d in "${apash_inDelimiters[@]}"; do
if [[ ${apash_inString:$apash_i:${#apash_d}} = "$apash_d" && ${#apash_d} -gt 0 ]]; then
apash_outArray+=("$apash_currentString")
apash_currentString=""
while [[ ${apash_inString:$apash_i:${#apash_d}} = "$apash_d" ]]; do
apash_i=$((apash_i + ${#apash_d}))
done
apash_i=$((apash_i - 1))
apash_matchD="true"
break
fi
done
[[ "$apash_matchD" == "true" ]] && continue # as for split
apash_currentString+=${apash_inString:$apash_i:1}
done
[ -n "$apash_currentString" ] && apash_outArray+=("$apash_currentString")
ArrayUtils.clone "apash_outArray" "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
StringUtils.splitPreserveAllTokens() {
Log.in $LINENO "$@"
local apash_ioArrayName="${1:-}"  
local apash_inString="${2:-}"
local apash_inDelimiter="${3:- }"
local apash_currentString=""
local -a apash_outArray=()
local -i apash_i
for (( apash_i=0; apash_i<${#apash_inString}; apash_i++ )); do
if [[ ${apash_inString:$apash_i:${#apash_inDelimiter}} = "$apash_inDelimiter" ]]; then
apash_outArray+=("$apash_currentString")
apash_currentString=""
apash_i=$((apash_i + ${#apash_inDelimiter}-1))
[[ apash_i -eq $((${#apash_inString}-1)) ]] && apash_outArray+=("")
continue
fi
apash_currentString+=${apash_inString:$apash_i:1}
done
[ -n "$apash_currentString" ] && apash_outArray+=("$apash_currentString")
ArrayUtils.clone "apash_outArray" "$apash_ioArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
StringUtils.startsWith(){
Log.in $LINENO "$@"
local inString="${1:-}"
local inPrefix="${2:-}"
if [ "$APASH_SHELL" = "zsh" ]; then
[[ "${inString:0:${#inPrefix}}" == "$inPrefix" ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
else # bash
[[ $inString =~ ^"$inPrefix" ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
fi
Log.out $LINENO; return "$APASH_FAILURE"
}
StringUtils.substring() {
Log.in $LINENO "$@"
local inString="${1:-}"
local start=${2:-0}
local end=${3:-${#inString}}
[[ $start -lt 0 ]] && start=$((${#inString}+start))
[[ $end -lt 0 ]]   && end=$((${#inString}+end))
[[ $start -lt 0 ]] && start=0
[[ $end -lt 0 ]] && end=0
[[ $start -gt ${#inString} ]] && start=${#inString}
[[ $end -gt ${#inString} ]] && end=${#inString}
if [[ $start -ge $end ]]; then
echo "" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
fi
local substring=${inString:$start:$((end - start))}
echo "$substring" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
StringUtils.trim() {
Log.in $LINENO "$@"
local inString="${1:-}"
local trimmedString=""
trimmedString="$(echo "$inString" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
echo "$trimmedString" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
StringUtils.upperCase() {
Log.in $LINENO "$@"
local inString="${1:-}"
if [ "$APASH_SHELL" = "zsh" ]; then
echo "${(U)inString}" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
elif [ "$APASH_SHELL" = "bash" ] && \
! VersionUtils.isLowerOrEquals "$APASH_SHELL_VERSION" "4.2"; then
echo "${inString^^}" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
else # More POSIX
echo "$inString" | awk '{print toupper($0)}' && { Log.out $LINENO; return "$APASH_SUCCESS"; }
fi
Log.out $LINENO; return "$APASH_FAILURE"
}
commons-lang.StringUtils() { true; }
VersionUtils.compare() {
Log.in $LINENO "$@"
local version1="${1:-}"
local version2="${2:-}"
local -a vArray1=()
local -a vArray2=()
local -i i
[[ "$version1" == "$version2" ]] && echo "0" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
StringUtils.splitAny "vArray1" "$version1" "." "-"
StringUtils.splitAny "vArray2" "$version2" "." "-"
maxIndex=$((APASH_ARRAY_FIRST_INDEX + $(NumberUtils.max "${#vArray1[@]}" "${#vArray2[@]}")))
for (( i=APASH_ARRAY_FIRST_INDEX; i < maxIndex; i++)); do
[[ "${vArray1[i]:-}" == "${vArray2[i]:-}" ]] && continue
if [[ $i -lt $((APASH_ARRAY_FIRST_INDEX+4)) ]]; then
[[ -n "${vArray1[i]:-}" && -z "${vArray2[i]:-}" ]] && echo "-1" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
[[ -z "${vArray1[i]:-}" && -n "${vArray2[i]:-}" ]] && echo "1"  && { Log.out $LINENO; return "$APASH_SUCCESS"; }
else
[[ -n "${vArray1[i]:-}" && -z "${vArray2[i]:-}" ]] && echo "1"  && { Log.out $LINENO; return "$APASH_SUCCESS"; }
[[ -z "${vArray1[i]:-}" && -n "${vArray2[i]:-}" ]] && echo "-1" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
fi
if NumberUtils.isLongPositive "${vArray1[i]:-}" \
&& NumberUtils.isLongPositive "${vArray2[i]:-}" ; then
if [[ ${vArray1[i]:-} -lt  ${vArray2[i]:-}  ]]; then
echo "-1" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
else
echo "1"  && { Log.out $LINENO; return "$APASH_SUCCESS"; }
fi
else # At least one fied is not numeric, then check alphanumeric order
if [[ "${vArray1[i]:-}" <  "${vArray2[i]:-}"  ]]; then
echo "-1" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
else
echo "1"  && { Log.out $LINENO; return "$APASH_SUCCESS"; }
fi
fi
done
Log.out $LINENO; return "$APASH_FAILURE"
}
VersionUtils.isLowerOrEquals() {
Log.in $LINENO "$@"
local version1="${1:-}"
local version2="${2:-}"
local comp
comp=$(VersionUtils.compare "$version1" "$version2") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
[[ "$comp" == "-1" || "$comp" == "0" ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
Log.out $LINENO; return "$APASH_FAILURE"
}
commons-lang.VersionUtils() { true; }
apash.commons-lang() { true; }
Integer_MIN_VALUE=-2147483648
Integer_MAX_VALUE=2147483647
lang.Integer() { true; }
Long_MIN_VALUE=-9223372036854775808
Long_MAX_VALUE=9223372036854775807
lang.Long() { true; }
Math.abs() {
Log.in $LINENO "$@"
local inNumber="${1:-}"
NumberUtils.isParsable "$inNumber" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
echo "${inNumber#-}"               || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
Math.max() {
Log.in $LINENO "$@"
local inNum1="${1:-}"
local inNum2="${2:-}"
local max
NumberUtils.isParsable "$inNum1" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
NumberUtils.isParsable "$inNum2" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if ShellUtils.isCommandValid "bc"; then
max=$(echo "if ($inNum1 < $inNum2) 0 else 1" | bc -lq)
if [[ $max -eq 1 ]]; then
echo "$inNum1" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
else
echo "$inNum2" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
fi
else
[ "$APASH_LOG_WARNING_DEGRADED" = "true" ] && Log.warn $LINENO "**DEGRADED MODE** bc command not found."
if awk -v inNum1="$inNum1" -v inNum2="$inNum2" 'BEGIN {exit !(inNum1 < inNum2)}'; then
echo "$inNum2" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
else
echo "$inNum1" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
fi
fi
Log.out $LINENO; return "$APASH_FAILURE"
}
Math.min() {
Log.in $LINENO "$@"
local inNum1="${1:-}"
local inNum2="${2:-}"
local min
NumberUtils.isParsable "$inNum1" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
NumberUtils.isParsable "$inNum2" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if ShellUtils.isCommandValid "bc"; then
min=$(echo "if ($inNum1 > $inNum2) 1 else 0" | bc -lq)
if [[ $min -eq 0 ]]; then
echo "$inNum1" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
else
echo "$inNum2" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
fi
else
[ "$APASH_LOG_WARNING_DEGRADED" = "true" ] && Log.warn $LINENO "**DEGRADED MODE** bc command not found."
if awk -v inNum1="$inNum1" -v inNum2="$inNum2" 'BEGIN {exit !(inNum1 > inNum2)}'; then
echo "$inNum2" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
else
echo "$inNum1" && { Log.out $LINENO; return "$APASH_SUCCESS"; }  
fi
fi
Log.out $LINENO; return "$APASH_FAILURE"
}
commons-lang.MathUtils() { true; }
apash.lang() { true; }
Array.bubbleSort() {
Log.in $LINENO "$@"
local apash_inArrayName="${1:-}"
local apash_lastIndex
local apash_temp
local -a apash_outArray=()
local -i apash_i apash_j
ArrayUtils.nullToEmpty "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
ArrayUtils.clone "$apash_inArrayName" "apash_outArray"
apash_lastIndex=$(ArrayUtils.getLastIndex "$apash_inArrayName") || { Log.ex $LINENO; return "$APASH_FAILURE"; }
for (( apash_i=APASH_ARRAY_FIRST_INDEX; apash_i < APASH_ARRAY_FIRST_INDEX+apash_lastIndex+1; apash_i++ )); do
for (( apash_j=APASH_ARRAY_FIRST_INDEX; apash_j < APASH_ARRAY_FIRST_INDEX+apash_lastIndex+1-apash_i-1; apash_j++ )); do
if [[ "${apash_outArray[apash_j]}" > "${apash_outArray[apash_j+1]}" ]]; then
apash_temp="${apash_outArray[apash_j]}"
apash_outArray[apash_j]="${apash_outArray[apash_j+1]}"
apash_outArray[apash_j+1]="$apash_temp"
fi
done
done
ArrayUtils.clone "apash_outArray" "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
Array.sort() {
Log.in $LINENO "$@"
local apash_inArrayName="${1:-}"
ArrayUtils.nullToEmpty "$apash_inArrayName" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
if [ "$APASH_SHELL" = "zsh" ]; then
local apash_inArray=("${(o)${(P)apash_inArrayName}[@]}")
ArrayUtils.clone "apash_inArray" "$apash_inArrayName" && { Log.out $LINENO; return "$APASH_SUCCESS"; }
else # bash
local -n inArray="$apash_inArrayName"
[[ ${#inArray[@]} -eq 0 ]] && { Log.out $LINENO; return "$APASH_SUCCESS"; }
if VersionUtils.isLowerOrEquals "$APASH_SHELL_VERSION" "4.3"; then
Array.bubbleSort "$apash_inArrayName" &&  { Log.out $LINENO; return "$APASH_SUCCESS"; }
else
readarray -d '' inArray < <(printf "%s\0" "${inArray[@]}" | sort -z) && { Log.out $LINENO; return "$APASH_SUCCESS"; }
fi
fi
Log.out $LINENO; return "$APASH_FAILURE"
}
util.Array() { true; }
Log.debug() {
local inLineNumber="${1:-}"
local inMessage="${2:-}"
local inFunction="${3:-$(ShellUtils.getParentFunctionName)}"
local inChannel="${4:-2}"
Log.message "$APASH_LOG_LEVEL_DEBUG" "$inFunction" "$inLineNumber" "$inMessage" "$inChannel" && return "$APASH_SUCCESS"
return "$APASH_FAILURE"
}
Log.error() {
local inLineNumber="${1:-}"
local inMessage="${2:-}"
local inFunction="${3:-$(ShellUtils.getParentFunctionName)}"
local inChannel="${4:-2}"
Log.message "$APASH_LOG_LEVEL_ERROR" "$inFunction" "$inLineNumber" "$inMessage" "$inChannel" && return "$APASH_SUCCESS"
return "$APASH_FAILURE"
}
Log.ex() {
[ "$APASH_LOG_LEVEL_ERROR" -gt "$APASH_LOG_LEVEL" ] && return "$APASH_SUCCESS"
local inLineNumber="${1:-}"
local parentFunction
local outMessage="Exception"
local -i i
if [ "$APASH_LOG_STACK_TRACE" = "true" ]; then
local APASH_LOG_STACK_TRACE_MAX_DEFAULT=10
local APASH_LOG_STACK_TRACE_MAX=${APASH_LOG_STACK_TRACE_MAX:-$APASH_LOG_STACK_TRACE_MAX_DEFAULT}
local stackSize
local stackBound
if [ "$APASH_SHELL" = "bash" ]; then
stackSize="${#FUNCNAME[@]}"
stackBound="$(APASH_LOG_LEVEL="$APASH_LOG_LEVEL_OFF" Math.min "$APASH_LOG_STACK_TRACE_MAX" "$((APASH_ARRAY_FIRST_INDEX+stackSize-1))" || echo $APASH_LOG_STACK_TRACE_MAX_DEFAULT )"
for (( i=APASH_ARRAY_FIRST_INDEX; i < stackBound; i++ )); do
outMessage+=$'\n'"  at ${FUNCNAME[i+1]}(${BASH_SOURCE[i+1]}:${BASH_LINENO[i]})"
done
elif [ "$APASH_SHELL" = "zsh" ]; then
stackSize="${#funcfiletrace[@]}"
stackBound="$(APASH_LOG_LEVEL="$APASH_LOG_LEVEL_OFF" Math.min "$APASH_LOG_STACK_TRACE_MAX" "$((APASH_ARRAY_FIRST_INDEX+stackSize-1))" || echo $APASH_LOG_STACK_TRACE_MAX_DEFAULT )"
for (( i=APASH_ARRAY_FIRST_INDEX+1; i < stackBound; i++ )); do
outMessage+=$'\n'"  at ${funcstack[i]}(${funcfiletrace[i]})"
done
fi
[ "$APASH_LOG_STACK_TRACE_MAX" -le "$stackBound" ] && outMessage+=$'\n'"  ..."
fi
parentFunction="$(APASH_LOG_LEVEL="$APASH_LOG_LEVEL_OFF" ShellUtils.getParentFunctionName || echo "Unknown")" 
Log.message "$APASH_LOG_LEVEL_ERROR" "$parentFunction" "$inLineNumber" "$outMessage" || return "$APASH_FAILURE"
return "$APASH_SUCCESS"
}
Log.fatal() {
local inLineNumber="${1:-}"
local inMessage="${2:-}"
local inFunction="${3:-$(ShellUtils.getParentFunctionName)}"
local inChannel="${4:-2}"
Log.message "$APASH_LOG_LEVEL_FATAL" "$inFunction" "$inLineNumber" "$inMessage" "$inChannel" && return "$APASH_SUCCESS"
return "$APASH_FAILURE"
}
Log.in() {
[ "$APASH_LOG_LEVEL_TRACE" -gt "$APASH_LOG_LEVEL" ] && return "$APASH_SUCCESS"
local inLineNumber="${1:-}"
local parentFunction
local args
local arg
shift
parentFunction="$(APASH_LOG_LEVEL="$APASH_LOG_LEVEL_OFF" ShellUtils.getParentFunctionName || echo "Unknown")"
for arg in "$@"; do
args+="'$arg' "
done
Log.message "$APASH_LOG_LEVEL_TRACE" "$parentFunction" "$inLineNumber" "In $parentFunction $args" && return "$APASH_SUCCESS"
return "$APASH_FAILURE"
}
Log.info() {
local inLineNumber="${1:-}"
local inMessage="${2:-}"
local inFunction="${3:-$(ShellUtils.getParentFunctionName)}"
local inChannel="${4:-2}"
Log.message "$APASH_LOG_LEVEL_INFO" "$inFunction" "$inLineNumber" "$inMessage" "$inChannel" && return "$APASH_SUCCESS"
return "$APASH_FAILURE"
}
Log.message() {
local inLevel="${1:-}"
local inFunction="${2:-}"
local inLineNumber="${3:-}"
local inMessage="${4:-}"
local inChannel="${5:-$APASH_LOG_CHANNEL_STDERR}"
local inLevelStr="${APASH_LOG_LEVEL_STR[$inLevel]}"
[ -z "$inLevelStr" ] && inLevelStr="Custom-$inLevel"
[ "$inLevel" -gt "$APASH_LOG_LEVEL" ] && return "$APASH_SUCCESS"
[ -n "$APASH_LOG_BLACKLIST" ] && [[   ":$APASH_LOG_BLACKLIST:" =~ :"$inFunction": ]] && return "$APASH_SUCCESS"
[ -n "$APASH_LOG_WHITELIST" ] && [[ ! ":$APASH_LOG_WHITELIST:" =~ :"$inFunction": ]] && return "$APASH_SUCCESS"
echo "$(date +"%FT%T.%3N%z") [$inLevelStr] $inFunction ($inLineNumber): $inMessage" >&"$inChannel" && return "$APASH_SUCCESS"
return "$APASH_FAILURE"
}
Log.out() {
[ "$APASH_LOG_LEVEL_TRACE" -gt "$APASH_LOG_LEVEL" ] && return "$APASH_SUCCESS"
local inLineNumber="${1:-}"
local parentFunction
local outMessage="Out"
local args
local arg
shift 1
parentFunction="$(APASH_LOG_LEVEL="$APASH_LOG_LEVEL_OFF" ShellUtils.getParentFunctionName || echo "Unknown")"
for arg in "$@"; do
args+="'$arg' "
done
[ -n "${args[*]}" ] && outMessage="$outMessage { $args}"
Log.message "$APASH_LOG_LEVEL_TRACE" "$parentFunction" "$inLineNumber" "$outMessage" && return "$APASH_SUCCESS"
return "$APASH_FAILURE"
}
Log.trace() {
local inLineNumber="${1:-}"
local inMessage="${2:-}"
local inFunction="${3:-$(ShellUtils.getParentFunctionName)}"
local inChannel="${4:-2}"
Log.message "$APASH_LOG_LEVEL_TRACE" "$inFunction" "$inLineNumber" "$inMessage" "$inChannel" && return "$APASH_SUCCESS"
return "$APASH_FAILURE"
}
Log.warn() {
local inLineNumber="${1:-}"
local inMessage="${2:-}"
local inFunction="${3:-$(ShellUtils.getParentFunctionName)}"
local inChannel="${4:-2}"
Log.message "$APASH_LOG_LEVEL_WARN" "$inFunction" "$inLineNumber" "$inMessage" "$inChannel" && return "$APASH_SUCCESS"
return "$APASH_FAILURE"
}
APASH_LOG_LEVEL_OFF=0
APASH_LOG_LEVEL_FATAL=100
APASH_LOG_LEVEL_ERROR=200
APASH_LOG_LEVEL_WARN=300
APASH_LOG_LEVEL_INFO=400
APASH_LOG_LEVEL_DEBUG=500
APASH_LOG_LEVEL_TRACE=600
APASH_LOG_LEVEL_ALL="$Integer_MAX_VALUE"
APASH_LOG_LEVEL="${APASH_LOG_LEVEL:-$APASH_LOG_LEVEL_WARN}"
APASH_LOG_STACK_TRACE="${APASH_LOG_STACK_TRACE:-false}"
APASH_LOG_CHANNEL_STDOUT=1
APASH_LOG_CHANNEL_STDERR=2
declare -Ag APASH_LOG_LEVEL_STR
APASH_LOG_LEVEL_STR[$APASH_LOG_LEVEL_OFF]="OFF"
APASH_LOG_LEVEL_STR[$APASH_LOG_LEVEL_FATAL]="FATAL"
APASH_LOG_LEVEL_STR[$APASH_LOG_LEVEL_ERROR]="ERROR"
APASH_LOG_LEVEL_STR[$APASH_LOG_LEVEL_WARN]="WARN"
APASH_LOG_LEVEL_STR[$APASH_LOG_LEVEL_INFO]="INFO"
APASH_LOG_LEVEL_STR[$APASH_LOG_LEVEL_DEBUG]="DEBUG"
APASH_LOG_LEVEL_STR[$APASH_LOG_LEVEL_TRACE]="TRACE"
APASH_LOG_LEVEL_STR[$APASH_LOG_LEVEL_ALL]="ALL"
util.Log() { true; }
Random.nextInt() {
local minValue="${1:-}"
local maxValue="${2:-}"
[[ -z $minValue && $# -lt 1 ]] && minValue=$Integer_MIN_VALUE
[[ -z $maxValue && $# -lt 2 ]] && maxValue=$Integer_MAX_VALUE
NumberUtils.isInteger "$minValue" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
NumberUtils.isInteger "$maxValue" || { Log.ex $LINENO; return "$APASH_FAILURE"; }
[[ $minValue -gt $maxValue ]] && { Log.ex $LINENO; return "$APASH_FAILURE"; }
echo $(( RANDOM * (maxValue - minValue) / 32768 + minValue )) || { Log.ex $LINENO; return "$APASH_FAILURE"; }
Log.out $LINENO; return "$APASH_SUCCESS"
}
util.Random() { true; }
apash.util() { true; }

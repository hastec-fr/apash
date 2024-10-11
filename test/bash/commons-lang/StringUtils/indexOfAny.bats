#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.StringUtils.indexOfAny
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "StringUtils.indexOfAny returns -1 when no arguments " {
  run StringUtils.indexOfAny
  [ "$output" = "-1" ]
}

@test "StringUtils.indexOfAny returns -1 when no research provided" {
  run StringUtils.indexOfAny "abcd"
  [ "$output" = "-1" ]
}

@test "StringUtils.indexOfAny returns index when research match in the string" {
  local arr=( "ab" "cd" )
  run StringUtils.indexOfAny "zzabyycdxx" arr
  [ "$output" = "2" ]
}

@test "StringUtils.indexOfAny returns the minimum index when research match in the string" {
  local arr=( "cd" "ab" )
  run StringUtils.indexOfAny "zzabyycdxx" arr
  [ "$output" = "2" ]
}

@test "StringUtils.indexOfAny returns -1 when no research match in the string" {
  local arr=( "mn" "op" )
  run StringUtils.indexOfAny "zzabyycdxx" arr
  [ "$output" = "-1" ]
}

@test "StringUtils.indexOfAny returns index on longer researh" {
  local arr=( "zab" "aby" )
  run StringUtils.indexOfAny "zzabyycdxx" arr
  [ "$output" = "1" ]
}

@test "StringUtils.indexOfAny returns 0 when research is empty" {
  local arr=( "" )
  run StringUtils.indexOfAny "zzabyycdxx" arr
  [ "$output" = "0" ]
}

@test "StringUtils.indexOfAny returns 0 when string and research are empty" {
  local arr=( "" )
  run StringUtils.indexOfAny "" arr
  [ "$output" = "0" ]
}

@test "StringUtils.indexOfAny returns -1 when string is empty but not the research" {
  local arr=( "a" )
  run StringUtils.indexOfAny "" arr
  [ "$output" = "-1" ]
}
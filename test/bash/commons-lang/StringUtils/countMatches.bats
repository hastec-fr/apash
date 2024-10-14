#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.StringUtils.countMatches
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "StringUtils.countMatches returns 0 if string or substring are empty" {
  run StringUtils.countMatches "" ""
  [ "$output" == "0"  ]
  
  run StringUtils.countMatches "" "a"
  [ "$output" == "0"  ]

  run StringUtils.countMatches "abba" ""
  [ "$output" == "0"  ]
}

@test "StringUtils.countMatches returns the number of occurence of the substring within the string" {
  run StringUtils.countMatches "abba" "a"
  [ "$output" == "2"  ]
  
  run StringUtils.countMatches "abba" "ab"
  [ "$output" == "1"  ]

  run StringUtils.countMatches "abba" "xxx"
  [ "$output" == "0"  ]
}

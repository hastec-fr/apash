#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.StringUtils.reverse
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

setup_file(){
  bats_require_minimum_version 1.5.0
}

@test "StringUtils.reverse returns empty string input string is empty)" {
  run --separate-stderr StringUtils.reverse
  [ "$status" = 0  ]
  [ "$output" = "" ]

  run --separate-stderr StringUtils.reverse ""
  [ "$status" = 0  ]
  [ "$output" = "" ]
}

@test "StringUtils.reverse returns the reversed string" {
  run --separate-stderr StringUtils.reverse "bat"
  [ "$status" = 0  ]
  [ "$output" = "tab" ]

  run --separate-stderr StringUtils.reverse "bat man"
  [ "$status" = 0 ]
  [ "$output" = "nam tab" ]
}



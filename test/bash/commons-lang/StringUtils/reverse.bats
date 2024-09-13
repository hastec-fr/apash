#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.StringUtils.reverse

# equals #########################################
@test "reverse returns empty string input string is empty)" {
  run StringUtils.reverse
  [ "$status" = 0  ]
  [ "$output" = "" ]

  run StringUtils.reverse ""
  [ "$status" = 0  ]
  [ "$output" = "" ]
}

@test "reverse returns the reversed string" {
  run StringUtils.reverse "bat"
  [ "$status" = 0  ]
  [ "$output" = "tab" ]

  run StringUtils.reverse "bat man"
  [ "$status" = 0 ]
  [ "$output" = "nam tab" ]
}



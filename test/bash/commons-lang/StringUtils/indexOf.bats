#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash/apash.sh
import fr.hastec.apash.commons-lang.StringUtils.indexOf

# indexOf ########################################
@test "indexOf returns 0 without arguments " {
  run StringUtils.indexOf
  [ "$output" = "0" ]
}

@test "indexOf returns 0 with empty arguments " {
  run StringUtils.indexOf "" ""
  [ "$output" = "0" ]
}

@test "indexOf returns -1 when string to check is empty and search is not empty " {
  run StringUtils.indexOf "" "*"
  [ "$output" = "-1" ]
}

@test "indexOf returns 0 when string to check is not empty and search is empty " {
  run StringUtils.indexOf "aabaabaa" ""
  [ "$output" = "0" ]
}

@test "indexOf returns 2 when third character is matching" {
  run StringUtils.indexOf "aabaabaa" "b"
  [ "$output" = "2" ]
}

@test "indexOf returns 1 when first sequence character is matching at second letter" {
  run StringUtils.indexOf "aabaabaa" "ab"
  [ "$output" = "1" ]
}

@test "indexOf returns -1 when research is not matching in the string" {
  run StringUtils.indexOf "aabaabaa" "mn"
  [ "$output" = "-1" ]
}

@test "indexOf returns 0 when research is completly matching the string" {
  run StringUtils.indexOf "aabaabaa" "aabaabaa"
  [ "$output" = "0" ]
}
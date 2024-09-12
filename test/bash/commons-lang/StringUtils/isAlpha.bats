#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.StringUtils.isAlpha

# isAlpha ########################################
@test "isAlpha fails when input string is empty or blank" {
  run StringUtils.isAlpha
  [ "$status" -eq 1 ]

  run StringUtils.isAlpha "    "
  [ "$status" -eq 1 ]
}

@test "isAlpha succeed when input string contains only letters" {
  StringUtils.isAlpha "abc"

  StringUtils.isAlpha "aBc"

  StringUtils.isAlpha "aBéc"
}

@test "isAlpha fails when input string contains other characters than letters" {
  run StringUtils.isAlpha "ab-c"
   [ "$status" -eq 1 ]

  run StringUtils.isAlpha "ab2c"
   [ "$status" -eq 1 ]

  run StringUtils.isAlpha "abc def"
   [ "$status" -eq 1 ]
}

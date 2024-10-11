#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.NumberUtils.compare
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "NumberUtils.compare fails when the inputs are not integers " {
  run NumberUtils.compare
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run NumberUtils.compare ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run NumberUtils.compare "a" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
  
  run NumberUtils.compare "1.2" "0"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "NumberUtils.compare return 0 when numbers are equals" {
  run NumberUtils.compare "0" "0"
  [ "$status" -eq 0 ]
  [ "$output" = "0" ]
  
  run NumberUtils.compare "2" "2"
  [ "$status" -eq 0 ]
  [ "$output" = "0" ]

  run NumberUtils.compare "-2" "-2"
  [ "$status" -eq 0 ]
  [ "$output" = "0" ]
}

@test "NumberUtils.compare returns value greater than 0 when first number is greater than the second" {
  run NumberUtils.compare "2" "1"
  [ "$status" -eq 0 ]
  [ "$output" = "1" ]

  run NumberUtils.compare "10" "-1"
  [ "$status" -eq 0 ]
  [ "$output" = "11" ]

  run NumberUtils.compare "-1" "-2"
  [ "$status" -eq 0 ]
  [ "$output" = "1" ]
}

@test "NumberUtils.compare returns value smaller than 0 when first number is less than the second" {
  run NumberUtils.compare "1" "2"
  [ "$status" -eq 0 ]
  [ "$output" = "-1" ]

  run NumberUtils.compare "-1" "10"
  [ "$status" -eq 0 ]
  [ "$output" = "-11" ]

  run NumberUtils.compare "-2" "-1"
  [ "$status" -eq 0 ]
  [ "$output" = "-1" ]
}

#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.NumberUtils.max
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

setup_file(){
  bats_require_minimum_version 1.5.0
}

# max #########################################
@test "max returns empty value when at least one input is not parsable " {
  run --separate-stderr NumberUtils.max
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run --separate-stderr NumberUtils.max ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run --separate-stderr NumberUtils.max "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run --separate-stderr NumberUtils.max "0" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run --separate-stderr NumberUtils.max "a" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run --separate-stderr NumberUtils.max "a" "1" "2"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run --separate-stderr NumberUtils.max "0" "1" ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}


@test "max returns the greater value from a list of numbers." {
  run --separate-stderr NumberUtils.max "0" "2" "1"
  [ "$status" -eq 0  ]
  [ "$output" = "2"  ]

  run --separate-stderr NumberUtils.max "-2" "-3" "-4"
  [ "$status" -eq 0  ]
  [ "$output" = "-2"  ]

  run --separate-stderr NumberUtils.max "0.123" ".099" "-1"
  [ "$status" -eq 0  ]
  [ "$output" = "0.123"  ]
  
  run --separate-stderr NumberUtils.max "-.123" "0.123" ".123"
  [ "$status" -eq 0  ]
  [ "$output" = "0.123"  ]

  run --separate-stderr NumberUtils.max "000" "0" "00"
  [ "$status" -eq 0  ]
  [ "$output" = "000" ]
}

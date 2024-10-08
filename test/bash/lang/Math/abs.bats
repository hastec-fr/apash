#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.lang.Math.abs
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "absolute returns empty value when the input number is not parsable " {
  run Math.abs
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Math.abs ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Math.abs "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Math.abs "a12"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Math.abs " 12"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Math.abs "--12"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Math.abs "1-2"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Math.abs " 12"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Math.abs "1."
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Math.abs "0x1"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Math.abs "12L"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Math.abs "12e3"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}


@test "absolute returns the absolute value of the argument." {
  run Math.abs "123"
  [ "$output" = "123" ]

  run Math.abs "-12"
  [ "$output" = "12" ]
  
  run Math.abs "000"
  [ "$output" = "000" ]

  run Math.abs "1"
  [ "$output" = "1" ]

  run Math.abs "-123.45"
  [ "$output" = "123.45" ]

  run Math.abs ".123"
  [ "$output" = ".123" ]

  run Math.abs "-.123"
  [ "$output" = ".123" ]
}

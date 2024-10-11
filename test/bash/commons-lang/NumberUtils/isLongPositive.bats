#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.NumberUtils.isLongPositive
  apash.import fr.hastec.apash.lang.Long
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "NumberUtils.isLongPositive fails when the inputs is not a positive long number" {
  run NumberUtils.isLongPositive
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run NumberUtils.isLongPositive ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run NumberUtils.isLongPositive "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run NumberUtils.isLongPositive " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ] 
}

@test "NumberUtils.isLongPositive succeed when the input is a positive long number" {
  run NumberUtils.isLongPositive "0"
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]

  run NumberUtils.isLongPositive 1
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]

  run NumberUtils.isLongPositive "$Long_MAX_VALUE"
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]
}

@test "NumberUtils.isLongPositive fails when index is out of range" {
  run NumberUtils.isLongPositive 9223372036854775808
  [ "$status" -eq 1  ]
  [ "$output" = ""   ]

  run NumberUtils.isLongPositive -1
  [ "$status" -eq 1  ]
  [ "$output" = ""   ]

  run NumberUtils.isLongPositive 1.2
  [ "$status" -eq 1  ]
  [ "$output" = ""   ]
}

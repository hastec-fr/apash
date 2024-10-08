#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.util.Random.nextInt
  apash.import fr.hastec.apash.commons-lang.NumberUtils
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "nextInt succeed and return integer between bound" {
  myInt=$(Random.nextInt)
  NumberUtils.isInteger $myInt

  myInt=$(Random.nextInt 10)
  NumberUtils.isInteger $myInt
  [ "$myInt" -ge 10 ]

  myInt=$(Random.nextInt 0 10)
  NumberUtils.isInteger $myInt
  [ "$myInt" -ge 0  ]
  [ "$myInt" -lt 10 ]

  myInt=$(Random.nextInt -10 0)
  NumberUtils.isInteger $myInt
  [ "$myInt" -ge -10   ]
  [ "$myInt" -lt 0     ]

  myInt=$(Random.nextInt 10 20)
  NumberUtils.isInteger $myInt
  [ "$myInt" -ge 10   ]
  [ "$myInt" -lt 20   ]

  myInt=$(Random.nextInt -20 -10)
  NumberUtils.isInteger $myInt
  [ "$myInt" -ge -20   ]
  [ "$myInt" -lt -10   ]

  myInt=$(Random.nextInt 5 5)
  NumberUtils.isInteger $myInt
  [ "$myInt" -eq 5  ]
}

@test "nextInt fails when numbers are not integer" {
  run Random.nextInt ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Random.nextInt "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Random.nextInt "1" "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Random.nextInt "3147483647"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Random.nextInt "-3147483648"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Random.nextInt 0 "3147483647"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Random.nextInt "-3147483648" 0
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "nextInt failes when min value is greater than maxValue" {
  run Random.nextInt 10 1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run Random.nextInt 0 -1
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}
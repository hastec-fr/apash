#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isArrayIndex

# min #########################################
@test "isArrayIndex fails when the inputs is not a positive long number" {
  run ArrayUtils.isArrayIndex
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isArrayIndex ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isArrayIndex "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isArrayIndex " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ] 
}

@test "isArrayIndex succeed when the input is a positive long number" {
  run ArrayUtils.isArrayIndex "0"
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]

  run ArrayUtils.isArrayIndex 1
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]

  run ArrayUtils.isArrayIndex 9223372036854775807
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]
}

@test "isArrayIndex fails when index is out of range" {
  run ArrayUtils.isArrayIndex 9223372036854775808
  [ "$status" -eq 1  ]
  [ "$output" = ""   ]

  run ArrayUtils.isArrayIndex -1
  [ "$status" -eq 1  ]
  [ "$output" = ""   ]

  run ArrayUtils.isArrayIndex 1.2
  [ "$status" -eq 1  ]
  [ "$output" = ""   ]
}

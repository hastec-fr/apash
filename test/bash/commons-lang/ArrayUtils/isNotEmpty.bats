#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.isNotEmpty

# min #########################################
@test "isNotEmpty fails when the input do not refere to an array" {
  run ArrayUtils.isNotEmpty
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isNotEmpty ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isNotEmpty "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isNotEmpty " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isNotEmpty "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.isNotEmpty "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="a")
  run ArrayUtils.isNotEmpty "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "isNotEmpty succeed when the input array has at least one element" {
  myArray=("a")
  run ArrayUtils.isNotEmpty "myArray"
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]

  myArray=("")
  run ArrayUtils.isNotEmpty "myArray"
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]
}

@test "isNotEmpty fails when the input array does not have elements" {
  myArray=()
  run ArrayUtils.isNotEmpty "myArray"
  [ "$status" -eq 1  ]
  [ "$output" = ""   ]
}

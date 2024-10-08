#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.ArrayUtils.isEmpty
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "isEmpty fails when the input do not refere to an array" {
  run ArrayUtils.isEmpty
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isEmpty ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isEmpty "a"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isEmpty " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isEmpty "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.isEmpty "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="a")
  run ArrayUtils.isEmpty "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "isEmpty succeed when the input array does not have elements" {
  myArray=()
  run ArrayUtils.isEmpty "myArray"
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]
}

@test "isEmpty fails when the input array has elements" {
  myArray=("a")
  run ArrayUtils.isEmpty "myArray"
  [ "$status" -eq 1  ]
  [ "$output" = ""   ]

  myArray=("")
  run ArrayUtils.isEmpty "myArray"
  [ "$status" -eq 1  ]
  [ "$output" = ""   ]
}


#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.ArrayUtils.isSorted
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "ArrayUtils.isSorted fails when the input do not refer to an array" {
  run ArrayUtils.isSorted
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isSorted ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isSorted "myVar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isSorted " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.isSorted "myArray"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.isSorted "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="a")
  run ArrayUtils.isSorted "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "ArrayUtils.isSorted succeed when the input array is sorted in natural order" {
  local myArray=()
  run ArrayUtils.isSorted "myArray"
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]

  myArray=("a" "b" "c")
  run ArrayUtils.isSorted "myArray"
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]

  myArray=("beta-1" "beta-10" "beta-20")
  run ArrayUtils.isSorted "myArray"
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]

  myArray=("1" "a")
  run ArrayUtils.isSorted "myArray"
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]

  myArray=("" "1")
  run ArrayUtils.isSorted "myArray"
  [ "$status" -eq 0  ]
  [ "$output" = ""   ]
}

@test "ArrayUtils.isSorted fails when the input array is not sorted in natural order" {
  myArray=("a" "c" "b")
  run ArrayUtils.isSorted "myArray"
  [ "$status" -eq 1  ]
  [ "$output" = ""   ]

  myArray=("a" "b" "")
  run ArrayUtils.isSorted "myArray"
  [ "$status" -eq 1  ]
  [ "$output" = ""   ]
}

#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty


@test "nullToEmpty fails when the input name is not a valid variable name" {
  run ArrayUtils.nullToEmpty
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.nullToEmpty ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
  
  run ArrayUtils.nullToEmpty " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.nullToEmpty "my var"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.nullToEmpty "1myvar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  myVar=test
  run ArrayUtils.nullToEmpty "myVar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.nullToEmpty  "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  local -A myMap=(["foo"]="a")
  run ArrayUtils.nullToEmpty "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

}


@test "nullToEmpty succeed when reference if name is a valid array or not exists " {
  unset "myArray"
  ArrayUtils.nullToEmpty "myArray"
  [ "${#myArray[@]}" -eq 0  ]

  myArray=()
  ArrayUtils.nullToEmpty "myArray"
  [ "${#myArray[@]}" -eq 0  ]
}

@test "nullToEmpty preserve array if it already contains values" {
  myArray=("a" "b")
  ArrayUtils.nullToEmpty "myArray"
  [ "${#myArray[@]}" -eq 2 ]
  [ "${myArray[0]}" == "a"  ]
  [ "${myArray[1]}" == "b"  ]
}

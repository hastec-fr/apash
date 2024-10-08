#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.ArrayUtils.nullToEmpty

# min #########################################
@test "nullToEmpty fails when the input name is not a valid variable name" {
  run ArrayUtils.nullToEmpty
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.nullToEmpty ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.nullToEmpty "my var"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.nullToEmpty "1myvar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "nullToEmpty erase old reference if the name is a valid variable" {
  declare -A myMap
  ArrayUtils.nullToEmpty "myMap"
  [ "${#myMap[@]}" -eq 0  ]

  unset myMap
  local -A myMap=(["foo"]="bar")
  ArrayUtils.nullToEmpty "myMap"
  [ "${#myMap[@]}" -eq 0  ]
}

@test "nullToEmpty succeed when reference if name is a valid variable" {
  # unset "myArray"
  # ArrayUtils.nullToEmpty "myArray"
  # [ "${#myArray[@]}" -eq 0  ]

  unset "myVar"
  myVar="test"
  ArrayUtils.nullToEmpty "myVar"
  [ "${#myVar[@]}" -eq 0  ]

  unset "myMap"
  local -A myMap=(["foo"]="bar")
  ArrayUtils.nullToEmpty "myMap"
  [ "${#myMap[@]}" -eq 0  ]

  unset "myArray"
  local myArray=()
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

#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.ArrayUtils.init
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "ArrayUtils.init fails when the input name is not a valid array name" {
  run ArrayUtils.init
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.init ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
  
  run ArrayUtils.init " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.init "my var"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.init "1myvar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  myVar=test
  run ArrayUtils.init "myVar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  declare -A myMap
  run ArrayUtils.init "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  unset myMap
  local -A myMap=(["foo"]="bar")
  run ArrayUtils.init "myMap"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
}

@test "ArrayUtils.init succeed when reference if name is a valid array or not exists " {
  unset "myArray"
  ArrayUtils.init "myArray"
  [ "${#myArray[@]}" -eq 0  ]

  myArray=()
  ArrayUtils.init "myArray"
  [ "${#myArray[@]}" -eq 0  ]
}

@test "ArrayUtils.init does not preserve array if it already contains values" {
  myArray=("a" "b")
  ArrayUtils.init "myArray"
  [ "${#myArray[@]}" -eq 0 ]
}

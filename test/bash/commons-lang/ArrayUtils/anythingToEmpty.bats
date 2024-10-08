#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.ArrayUtils.anythingToEmpty
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "anythingToEmpty fails when the input name is not a valid variable name" {
  run ArrayUtils.anythingToEmpty
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.anythingToEmpty ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]
  
  run ArrayUtils.anythingToEmpty " "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.anythingToEmpty "my var"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run ArrayUtils.anythingToEmpty "1myvar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

}

@test "anythingToEmpty erase old reference if the name is a valid variable" {
  myVar=test
  ArrayUtils.anythingToEmpty "myVar"
  [ "${#myVar[@]}" -eq 0  ]

  declare -A myMap
  ArrayUtils.anythingToEmpty "myMap"
  [ "${#myMap[@]}" -eq 0  ]

  unset myMap
  local -A myMap=(["foo"]="bar")
  ArrayUtils.anythingToEmpty "myMap"
  [ "${#myMap[@]}" -eq 0  ]
}

@test "anythingToEmpty succeed when reference if name is a valid array or not exists " {
  unset "myArray"
  ArrayUtils.anythingToEmpty "myArray"
  [ "${#myArray[@]}" -eq 0  ]

  myArray=()
  ArrayUtils.anythingToEmpty "myArray"
  [ "${#myArray[@]}" -eq 0  ]
}

@test "anythingToEmpty does not preserve array if it already contains values" {
  myArray=("a" "b")
  ArrayUtils.anythingToEmpty "myArray"
  [ "${#myArray[@]}" -eq 0 ]
}

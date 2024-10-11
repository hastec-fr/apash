#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.StringUtils.split
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "StringUtils.split returns an empty array when the input string is empty " {
  local myArray=()
  StringUtils.split myArray "" ""
  [ "${#myArray[@]}" -eq 0 ]

  StringUtils.split myArray "" ":"
  [ "${#myArray[@]}" -eq 0 ]
}

@test "StringUtils.split returns the full string if the delimiter is empty " {
  local myArray=()
  StringUtils.split myArray "ab:cd:ef" ""
  [ "${#myArray[@]}" -eq 1 ]
  [ "${myArray[0]}" == "ab:cd:ef"  ]
  
  StringUtils.split myArray $'ab:cd:\nef' ""
  [ "${#myArray[@]}" -eq 1 ]
  [ "${myArray[0]}"  == $'ab:cd:\nef'  ]
}

@test "StringUtils.split returns the correct number of elements according to sequence occurence " {
  local myArray=()
  StringUtils.split myArray "ab:cd:ef" ":"
  [ "${#myArray[@]}" -eq 3 ]
  [ "${myArray[0]}" == "ab"  ]
  [ "${myArray[1]}" == "cd"  ]
  [ "${myArray[2]}" == "ef"  ]

  StringUtils.split myArray $'ab: cd:\nef gh:\nij ' ":"
  [ "${#myArray[@]}" -eq 4 ]
  [ "${myArray[0]}" == "ab"  ]
  [ "${myArray[1]}" == " cd" ]
  [ "${myArray[2]}" == $'\nef gh' ]
  [ "${myArray[3]}" == $'\nij '   ]

  StringUtils.split myArray "ab:cd:ef" "cd"
  [ "${#myArray[@]}" -eq 2 ]
  [ "${myArray[0]}" == "ab:" ]
  [ "${myArray[1]}" == ":ef" ]
}

@test "StringUtils.split returns item even when adjacent delimiter are encountered" {
  local myArray=()
  StringUtils.split myArray "ab::cd:ef" ":"
  [ "${#myArray[@]}" -eq 3  ]
  [ "${myArray[0]}" == "ab" ]
  [ "${myArray[1]}" == "cd" ]
  [ "${myArray[2]}" == "ef" ]

  StringUtils.split myArray $'ab\n\ncd\nef' $'\n'
  [ "${#myArray[@]}" -eq 3  ]
  [ "${myArray[0]}" == "ab" ]
  [ "${myArray[1]}" == "cd" ]
  [ "${myArray[2]}" == "ef" ]

  # @todo: Skip for the moment, ticket bats-core
  # StringUtils.split myArray "::ab::cd:::ef::" ":"
  # [ "${#myArray[@]}" -eq 3  ]
  # [ "${myArray[0]}" == "ab" ]
  # [ "${myArray[1]}" == "cd" ]
  # [ "${myArray[2]}" == "ef" ]

  # StringUtils.split myArray "abab::cd:ab:ef::ab" "ab"
  #   echo "count: ${#myArray[@]}"
  # [ "${#myArray[@]}" -eq 2  ]
  # [ "${myArray[0]}" == "::cd:" ]
  # [ "${myArray[1]}" == ":ef::" ]
}

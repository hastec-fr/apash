#!/usr/bin/env bats

source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
apash.import fr.hastec.apash.commons-lang.StringUtils.split

# source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/commons-lang/StringUtils.sh

# split #######################################
@test "split returns an empty array when the input string is empty " {
  StringUtils.split myArray "" ""
  [ "${#myArray[@]}" -eq 0 ]

    StringUtils.split myArray "" ":"
  [ "${#myArray[@]}" -eq 0 ]
}

@test "split returns the full string if the delimiter is empty " {
  local myArray=()
  StringUtils.split myArray "ab:cd:ef" ""
  [ "${#myArray[@]}" -eq 1 ]
  [ "${myArray[0]}" == "ab:cd:ef"  ]
  
  StringUtils.split myArray $'ab:cd:\nef' ""
  [ "${#myArray[@]}" -eq 1 ]
  [ "${myArray[0]}"  == $'ab:cd:\nef'  ]
}

@test "split returns the correct number of elements according to sequence occurence " {
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

@test "split returns item even when adjacent delimiter are encountered" {
  StringUtils.split myArray "ab::cd:ef" ":"
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "ab" ]
  [ "${myArray[1]}" == ""   ]
  [ "${myArray[2]}" == "cd" ]
  [ "${myArray[3]}" == "ef" ]

  StringUtils.split myArray $'ab\n\ncd\nef' $'\n'
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "ab" ]
  [ "${myArray[1]}" == ""   ]
  [ "${myArray[2]}" == "cd" ]
  [ "${myArray[3]}" == "ef" ]
}

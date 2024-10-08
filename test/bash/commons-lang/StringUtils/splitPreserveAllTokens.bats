#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.StringUtils.splitPreserveAllTokens
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "split returns an empty array when the input string is empty " {
  local myArray=()
  StringUtils.splitPreserveAllTokens myArray "" ""
  [ "${#myArray[@]}" -eq 0 ]

    StringUtils.splitPreserveAllTokens myArray "" ":"
  [ "${#myArray[@]}" -eq 0 ]
}

@test "split returns the full string if the delimiter is empty " {
  local myArray=()
  StringUtils.splitPreserveAllTokens myArray "ab:cd:ef" ""
  [ "${#myArray[@]}" -eq 1 ]
  [ "${myArray[0]}" == "ab:cd:ef"  ]
  
  StringUtils.splitPreserveAllTokens myArray $'ab:cd:\nef' ""
  [ "${#myArray[@]}" -eq 1 ]
  [ "${myArray[0]}"  == $'ab:cd:\nef'  ]
}

@test "split returns the correct number of elements according to sequence occurence " {
  local myArray=()
  StringUtils.splitPreserveAllTokens myArray "ab:cd:ef" ":"
  [ "${#myArray[@]}" -eq 3 ]
  [ "${myArray[0]}" == "ab"  ]
  [ "${myArray[1]}" == "cd"  ]
  [ "${myArray[2]}" == "ef"  ]

  StringUtils.splitPreserveAllTokens myArray $'ab: cd:\nef gh:\nij ' ":"
  [ "${#myArray[@]}" -eq 4 ]
  [ "${myArray[0]}" == "ab"  ]
  [ "${myArray[1]}" == " cd" ]
  [ "${myArray[2]}" == $'\nef gh' ]
  [ "${myArray[3]}" == $'\nij '   ]

  StringUtils.splitPreserveAllTokens myArray "ab:cd:ef" "cd"
  [ "${#myArray[@]}" -eq 2 ]
  [ "${myArray[0]}" == "ab:" ]
  [ "${myArray[1]}" == ":ef" ]
}

@test "split returns empty value when adjacent delimiter are encountered" {
  local myArray=()
  StringUtils.splitPreserveAllTokens myArray "ab::cd:ef" ":"
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "ab" ]
  [ "${myArray[1]}" == ""   ]
  [ "${myArray[2]}" == "cd" ]
  [ "${myArray[3]}" == "ef" ]

  StringUtils.splitPreserveAllTokens myArray $'ab\n\ncd\nef' $'\n'
  [ "${#myArray[@]}" -eq 4  ]
  [ "${myArray[0]}" == "ab" ]
  [ "${myArray[1]}" == ""   ]
  [ "${myArray[2]}" == "cd" ]
  [ "${myArray[3]}" == "ef" ]

  StringUtils.splitPreserveAllTokens myArray "::ab::cd:::ef::" ":"
  [ "${#myArray[@]}" -eq 10  ]
  [ "${myArray[0]}" == ""    ]
  [ "${myArray[1]}" == ""    ]
  [ "${myArray[2]}" == "ab"  ]
  [ "${myArray[3]}" == ""    ]
  [ "${myArray[4]}" == "cd"  ]
  [ "${myArray[5]}" == ""    ]
  [ "${myArray[6]}" == ""    ]
  [ "${myArray[7]}" == "ef"  ]
  [ "${myArray[8]}" == ""    ]
  [ "${myArray[9]}" == ""    ]

  StringUtils.splitPreserveAllTokens myArray "abab::cd:ab:ef::ab" "ab"
  [ "${#myArray[@]}" -eq 5     ]
  [ "${myArray[0]}" == ""      ]
  [ "${myArray[1]}" == ""      ]
  [ "${myArray[2]}" == "::cd:" ]
  [ "${myArray[3]}" == ":ef::" ]
  [ "${myArray[4]}" == ""      ]
}

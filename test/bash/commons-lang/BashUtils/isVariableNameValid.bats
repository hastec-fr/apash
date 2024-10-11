#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.BashUtils.isVariableNameValid
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "BashUtils.isVariableNameValid fails when the input name is not a valid variable name" {
  run BashUtils.isVariableNameValid
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run BashUtils.isVariableNameValid ""
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run BashUtils.isVariableNameValid "123"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run BashUtils.isVariableNameValid "1myVar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run BashUtils.isVariableNameValid "my Var"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run BashUtils.isVariableNameValid " myVar"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run BashUtils.isVariableNameValid "myVar "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run BashUtils.isVariableNameValid "my#Var "
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]

  run BashUtils.isVariableNameValid "myVér"
  [ "$status" -eq 1 ]
  [ "$output" = ""  ]  
}

@test "BashUtils.isVariableNameValid succeed when the variable name is valid" {
  BashUtils.isVariableNameValid "_myVar"
  BashUtils.isVariableNameValid "myVar"
  BashUtils.isVariableNameValid "myVar1"
  BashUtils.isVariableNameValid "my_Var1"
}


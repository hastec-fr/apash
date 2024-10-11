#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/$APASH_SHELL/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.StringUtils.lowerCase
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "StringUtils.lowerCase returns an empty string when input string is empty " {
  run StringUtils.lowerCase "" "" ""
  [ "$output" == ""  ]  
}

@test "StringUtils.lowerCase convert string to upper case" {
  run StringUtils.lowerCase "ABC"
  [ "$output" == "abc"  ]
  
  run StringUtils.lowerCase "AbC"
  [ "$output" == "abc"  ]

  run StringUtils.lowerCase "A123B"
  [ "$output" == "a123b"  ]

  run StringUtils.lowerCase "abc"
  [ "$output" == "abc"  ]

  run StringUtils.lowerCase "CRÈME BRÛLÉE"
  [ "$output" == "crème brûlée" ]
}

#!/usr/bin/env bats

if [ "$APASH_TEST_MINIFIED" != "true" ]; then
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../src/bash/fr/hastec/apash.sh
  apash.import fr.hastec.apash.commons-lang.StringUtils.abbreviate
else
  source $( dirname "$BATS_TEST_FILENAME" )/../../../../apash-bash-min.sh
fi

@test "abbreviate fails without valid max length" {
  run StringUtils.abbreviate
  [ "$status" -eq 1 ]

  run StringUtils.abbreviate "abcdef" "a"
  [ "$status" -eq 1 ]

  run StringUtils.abbreviate "abcdef" "1.2"
  [ "$status" -eq 1 ]
}

@test "abbreviate succeed with only max width value declared" {
  run StringUtils.abbreviate "" 4
  [ "$status" -eq 0 ]
  [ "$output" = ""  ]

  run StringUtils.abbreviate "abcdefg" 6
  [ "$status" -eq 0 ]
  [ "$output" = "abc..."  ]

  run StringUtils.abbreviate "abcdefg" 7
  [ "$status" -eq 0 ]
  [ "$output" = "abcdefg"  ]

  run StringUtils.abbreviate "abcdefg" 8
  [ "$status" -eq 0 ]
  [ "$output" = "abcdefg"  ]

  run StringUtils.abbreviate "abcdefg" 4
  [ "$status" -eq 0 ]
  [ "$output" = "a..."  ]
}

@test "abbreviate fails with only max width value declared" {
  run StringUtils.abbreviate "abcdefg" 3
  [ "$status" -eq 1 ]
}

@test "abbreviate succedd with only max width and offset declared" {
  run StringUtils.abbreviate "" 4 0
  [ "$status" -eq 0 ]
  [ "$output" = ""  ]

  run StringUtils.abbreviate "abcdefghijklmno" 10 -1
  [ "$status" -eq 0 ]
  [ "$output" = "abcdefg..."  ]

  run StringUtils.abbreviate "abcdefghijklmno" 10 0
  [ "$status" -eq 0 ]
  [ "$output" = "abcdefg..."  ]

  run StringUtils.abbreviate "abcdefghijklmno" 10 1
  [ "$status" -eq 0 ]
  [ "$output" = "abcdefg..."  ]

  run StringUtils.abbreviate "abcdefghijklmno" 10 4
  [ "$status" -eq 0 ]
  [ "$output" = "abcdefg..."  ]

  run StringUtils.abbreviate "abcdefghijklmno" 10 5
  [ "$status" -eq 0 ]
  [ "$output" = "...fghi..." ]

  run StringUtils.abbreviate "abcdefghijklmno" 10 6
  [ "$status" -eq 0 ]
  [ "$output" = "...ghij..." ]

  run StringUtils.abbreviate "abcdefghijklmno" 10 8
  [ "$status" -eq 0 ]
  [ "$output" = "...ijklmno" ]

  run StringUtils.abbreviate "abcdefghijklmno" 10 10
  [ "$status" -eq 0 ]
  [ "$output" = "...ijklmno" ]

  run StringUtils.abbreviate "abcdefghijklmno" 10 12 
  [ "$status" -eq 0 ]
  [ "$output" = "...ijklmno" ]
}

@test "abbreviate failed with only max width and offset declared" {
  run StringUtils.abbreviate "abcdefghij" 3 0
  [ "$status" -eq 1 ]
  [ "$output" = ""   ]

  run StringUtils.abbreviate "abcdefghij" 6 5
  [ "$status" -eq 1 ]
  [ "$output" = ""   ]  
}

@test "abbreviate succeed with everything declared" {
  run StringUtils.abbreviate "" 4 0 "..."
  [ "$status" -eq 0 ]
  [ "$output" = ""   ]

  run StringUtils.abbreviate "abcdefghijklmno" 10 -1 "---"
  [ "$status" -eq 0 ]
  [ "$output" = "abcdefg---" ]

  run StringUtils.abbreviate "abcdefghijklmno" 10 0 ","
  [ "$status" -eq 0 ]
  [ "$output" = "abcdefghi," ]

  run StringUtils.abbreviate "abcdefghijklmno" 10 1 ","
  [ "$status" -eq 0 ]
  [ "$output" = "abcdefghi," ]

  run StringUtils.abbreviate "abcdefghijklmno" 10 2 ","
  [ "$status" -eq 0 ]
  [ "$output" = "abcdefghi," ]

  run StringUtils.abbreviate "abcdefghijklmno" 10 4 "::"
  [ "$status" -eq 0 ]
  [ "$output" = "::efghij::" ]

  run StringUtils.abbreviate "abcdefghijklmno" 10 6 "..."
  [ "$status" -eq 0 ]
  [ "$output" = "...ghij..." ]

  run StringUtils.abbreviate "abcdefghijklmno" 10 9 '*'
  [ "$status" -eq 0 ]
  [ "$output" = "*ghijklmno" ]

  run StringUtils.abbreviate "abcdefghijklmno" 10 10 "'"
  [ "$status" -eq 0 ]
  [ "$output" = "'ghijklmno" ]

  run StringUtils.abbreviate "abcdefghijklmno" 10 12 "!"
  [ "$status" -eq 0 ]
  [ "$output" = "!ghijklmno" ]

}

@test "abbreviate failed with everything declared" {
  run StringUtils.abbreviate "abcdefghij" 4 0 "abra"
  [ "$status" -eq 1 ]
  [ "$output" = "" ]

  run StringUtils.abbreviate "abcdefghij" 6 5 "..."
  [ "$status" -eq 1 ]
  [ "$output" = "" ]
}

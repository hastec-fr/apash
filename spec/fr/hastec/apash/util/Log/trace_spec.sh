Describe 'Log.trace'
  apash.import "fr.hastec.apash.util.Log.trace"

  It 'passes when inputs are consistents and level autorized'
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_TRACE
    When call Log.trace 1 "Hello World" "apash"
    The output should equal ""
    The stderr should include "[TRACE] apash (1): Hello World"
    The status should be success
  End

  It 'passes when inputs are consistents and level not autorized'
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF
    When call Log.trace 2 "Hello World"
    The output should equal ""
    The stderr should equal ""
    The status should be success
  End
  
  It 'passes when inputs are consistents and level autorized and redirected to standard output'
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_TRACE
    When call Log.trace 3 "Hello World" "apash" $APASH_LOG_CHANNEL_STDOUT
    The output should include "[TRACE] apash (3): Hello World"
    The stderr should equal ""
    The status should be success
  End

  It 'passes when inputs are consistents and called from a function'
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_TRACE
    myCaller(){ Log.trace 1 "Hello World" ; }
    When call myCaller
    The output should equal ""
    The stderr should include "[TRACE] myCaller (1): Hello World"
    The status should be success
  End

End

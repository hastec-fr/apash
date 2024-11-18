Describe 'Log.in'
  apash.import "fr.hastec.apash.util.Log.in"

  It 'passes when inputs are consistents and level autorized'
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_TRACE
    myCaller(){ Log.in 1 "$@" ; }
    When call myCaller "Hello World"
    The output should equal ""
    The stderr should include "[TRACE] myCaller (1): In myCaller 'Hello World'"
    The status should be success
  End

  It 'passes when inputs are consistents and level not autorized'
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF
    myCaller(){ Log.in 1 "$@" ; }
    When call myCaller "Hello World"
    The output should equal ""
    The stderr should include ""
    The status should be success
  End
End

Describe 'Log.out'
  apash.import "fr.hastec.apash.util.Log.out"

  It 'passes when inputs are consistents and level autorized'
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_TRACE
    myCaller(){ Log.out 1 "myCaller-001" "$@" ; }
    When call myCaller "Hello World"
    The output should equal ""
    The stderr should include "[TRACE] myCaller (1): Out { 'myCaller-001' 'Hello World' }"
    The status should be success
  End

  It 'passes when inputs are consistents and level not autorized'
    export APASH_LOG_LEVEL=$APASH_LOG_LEVEL_OFF
    myCaller(){ Log.out 1 "$@" ; }
    When call myCaller "Hello World"
    The output should equal ""
    The stderr should include ""
    The status should be success
  End

End

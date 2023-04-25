; Define our multipress function

MultiPress() {
    check_chars := "0123456789-="

    ; main loop to search for hotkeys being held
    Loop
    {
        ; start each loop with found set to false
        ; if we find a hotkey we will set this to true
        ; if we don't find a hotkey we will return
        found := False

        ; loop through each of the check_chars
        Loop, Parse, check_chars
        {
            ; store the character we are checking in test_char
            test_char := A_LoopField

            ; check if the test_char is being held
            if (GetKeyState(test_char, "P")) {

                ; if the test_char is being held then we set found to true
                found := True ; set found to true

                ; check if a modifier is being held and send the appropriate key
                ; with it's modifier
                If ( GetKeyState("Shift", "P") ) {
                    Send, +%test_char%
                } Else If ( GetKeyState("Ctrl", "P") ) {
                    Send, ^%test_char%
                } Else If ( GetKeyState("Alt", "P") ) {
                    Send, !%test_char%
                } Else {
                    Send, %test_char%
                }

                ; once a key has been sent wait 100ms before performing another check
                Sleep, 100
            }
        }

        ; if no hotkeys were found to be active this check return
        if (!found) {
            return
        }
    }
}

; Define our AutoHotKey Bindings
; ------------------------------
; $ prevents the hotkey from triggering itself when we send the key
; * is a wildcard binding allowing the hotkey to trigger alongside shift and control
$*1::MultiPress()
$*2::MultiPress()
$*3::MultiPress()
$*4::MultiPress()
$*5::MultiPress()
$*6::MultiPress()
$*7::MultiPress()
$*9::MultiPress()
$*0::MultiPress()
$*-::MultiPress()
$*=::MultiPress()

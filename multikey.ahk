; Define our multipress function

MultiPress() {
    check_chars := "0123456789-="

    ; do the following loop while found is true
    Loop
    {

        found := False

        ; loop through each of the check_chars
        Loop, Parse, check_chars
        {
            test_char := A_LoopField
            if (GetKeyState(test_char, "P")) {
                found := True ; set found to true
                If ( GetKeyState("Shift", "P") ) {
                    Send, +%test_char%
                } Else If ( GetKeyState("Ctrl", "P") ) {
                    Send, ^%test_char%
                } Else If ( GetKeyState("Alt", "P") ) {
                    Send, !%test_char%
                } Else {
                    Send, %test_char%
                }

                Sleep, 100
            }
        }

        ; if found is false return
        if (!found) {
            return
        }
    }

    return
}

; Define our hotkeys

; if 1 is pressed call MultiPress()
; $ prevents the hotkey from triggering itself when we send the key
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


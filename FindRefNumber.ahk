#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^!1::
    oCB := ClipboardAll  ; save clipboard contents
    ClipBoard :=
    Send, ^c
    ClipWait
    number := RegExReplace(clipboard, "\s", "")
    ClipBoard := oCB ; restore clipboard contents
    FindRefNumber("https://cbre.service-now.com", number)
return

^!2::
    oCB := ClipboardAll  ; save clipboard contents
    ClipBoard :=
    Send, ^c
    ClipWait
    number := RegExReplace(clipboard, "\s", "")
    ClipBoard := oCB ; restore clipboard contents
    Gui, Add, Button, x10 y0 w150 h30 Default, &Dev
    Gui, Add, Button, x10 y40 w150 h30, &Test
    Gui, Add, Button, x10 y80 w150 h30, &Sandbox
    Gui, Add, Button, x10 y120 w150 h30, &Preprod
    Gui, Show,, Environment
Return

ButtonDev:
{
    Gui, Destroy
    FindRefNumber("https://cbredev.service-now.com", number)
}
return

ButtonTest:
{
    Gui, Destroy
    FindRefNumber("https://cbretest.service-now.com", number)
}
return

ButtonSandbox:
{
    Gui, Destroy
    FindRefNumber("https://cbresandbox.service-now.com", number)
}
return

ButtonPreprod:
{
    Gui, Destroy
    FindRefNumber("https://cbrepreprod.service-now.com", number)
}
return

FindRefNumber(env, number)
{
    link := env . "/nav_to.do?uri=text_search_exact_match.do?sysparm_search=" . number
    SetTitleMatchMode 2
    ; Uncomment both to try them in order, or just one to only try that one
    ; Use Chrome
    IfWinExist Google Chrome
        WinActivate, Google Chrome
    ; Use Firefox
    /*
    IfWinExist Firefox
        WinActivate, Firefox
    */
    SendInput ^t
    SendInput %link%
    SendInput {Enter}
}

guiclose:
exit:
{
    exitapp
}
return